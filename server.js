const express = require('express')
const mysql = require('mysql')
const cors = require('cors')
const multer = require('multer')
const path = require('path')
require('dotenv').config()

const app = express()

app.use(express.static(path.join(__dirname,"public")))
app.use(cors())
app.use(express.json())

const port = 5000

// const db = mysql.createConnection(process.env.DATABASE_URL)

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "mytest"
})

db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to MySQL database');
});

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'public/images'); // ระบุโฟลเดอร์ที่จะเก็บรูปภาพ
    },
    filename: function (req, file, cb) {
      const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
      cb(null, file.fieldname + '-' + uniqueSuffix + path.extname(file.originalname));
    }
  });

const upload = multer({ storage: storage });

app.post('/add_store', upload.single('logo'), (req, res) => {
    const {user_id,storeName, storeType, storeDes, style, province, phone, address } = req.body;

    // Check if req.file exists and has a valid filename
    if (!req.file || !req.file.filename) {
        return res.status(400).json({ message: 'No valid file uploaded' });
    }

    // Use the file path obtained from Multer
    const logo = req.file.filename;

    console.log('Uploaded image path:', logo);  // Log the uploaded image path

    const sql = 'INSERT INTO `stores`(`user_id`,`logo`,`storeName`, `storeType`, `storeDes`, `style`, `province`, `phone`, `address`) VALUES (?,?,?,?,?,?,?,?,?)';
    const values = [
      user_id,
        logo,
        storeName,
        storeType,
        storeDes,
        style,
        province,
        phone,
        address,
    ];

    db.query(sql, values, (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: 'Something unexpected has occurred ' + err });
        }
        return res.json({ success: "Store added successfully" });
    });
});

app.get("/stores_admin", (req, res) => {
    const sql = "SELECT " +
        "stores.storeId, " +
        "stores.logo, " +
        "stores.storeName, " +
        "stores.storeType, " +
        "stores.storeDes, " +
        "stores.style, " +
        "stores.province, " +
        "stores.phone, " +
        "stores.address, " +
        "stores.status, " +
        "statusdetail.statusName, " +
        "statusdetail.description " +
        "FROM stores " +
        "JOIN statusdetail ON stores.status = statusdetail.statusId";

    db.query(sql, (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Server Error" });
        }
        return res.json(result);
    });
});

app.get("/stores", (req, res) => {
    const sql = "SELECT * FROM `stores`";
    db.query(sql, (err, result) => {
        if (err) res.json({ message: "Server Error" });
        return res.json(result)
    })
})

app.get("/get_stores/:storeId", (req, res) => {
    const storeId = req.params.storeId;
    const sql = `
        SELECT 
            stores.storeId,
            stores.logo,
            stores.storeName,
            stores.storeType,
            stores.storeDes,
            stores.style,
            stores.province,
            stores.phone,
            stores.address,
            stores.status,
            statusdetail.statusName,
            statusdetail.description
        FROM stores
        JOIN statusdetail ON stores.status = statusdetail.statusId
        WHERE stores.storeId = ?`;
    
    db.query(sql, [storeId], (err, result) => {
        if (err) res.json({ message: "Server Error" });
        return res.json(result);
    });
});

app.get("/get_stores_check/:user_id", (req, res) => {
    const user_id = req.params.user_id;
    const sql = `
        SELECT 
            stores.storeId,
            stores.user_id,
            stores.logo,
            stores.storeName,
            stores.storeType,
            stores.storeDes,
            stores.style,
            stores.province,
            stores.phone,
            stores.address,
            stores.status,
            statusdetail.statusName,
            statusdetail.description
        FROM stores
        JOIN statusdetail ON stores.status = statusdetail.statusId
        WHERE stores.user_id = ? `;

    db.query(sql, [user_id], (err, result) => {
        if (err) res.json({ message: "Server Error" });
        return res.json(result);
    });
});

app.put("/edit_stores/:storeId", upload.single('logo'), (req, res) => {
    const storeId = req.params.storeId;

    let logoPath = req.body.logo; // Initialize the logoPath with the existing logo path

    // Check if a new image is provided
    if (req.file) {
        // If a new image is provided, update the logoPath
        logoPath = req.file.filename;
    }

    console.log('Updated image path:', logoPath);  // Log the updated image path

    const sql = "UPDATE `stores` SET `logo`=?, `storeName`=?, `storeType`=?, `storeDes`=?, `style`=?, `province`=?, `phone`=?, `address`=?, `status`=? WHERE `storeId` = ?";
    const values = [
        logoPath, // Use the updated logoPath
        req.body.storeName,
        req.body.storeType,
        req.body.storeDes,
        req.body.style,
        req.body.province,
        req.body.phone,
        req.body.address,
        req.body.status,
        storeId
    ];

    db.query(sql, values, (err, result) => {
        if (err) return res.json({ message: "Server Error" });
        return res.json(result);
    });
});

app.delete("/delete_stores/:storeId", (req, res) => {
    const storeId = req.params.storeId;
    const sql = "DELETE FROM `stores` WHERE `storeId`=?";
    const values = [storeId];
    db.query(sql, values, (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Server Error" });
        }
        // Check if any rows were affected, indicating a successful deletion
        if (result.affectedRows > 0) {
            return res.status(204).send(); // No Content
        } else {
            return res.status(404).json({ message: "Store not found" });
        }
    });
});

// Pass the db connection to the routes
const usersRoute = require('./routes/users')(db);
app.use(usersRoute);

const mulimagesRoute = require('./routes/mulimagestb')(db);
app.use(mulimagesRoute);

const promotionRoute = require('./routes/promotion')(db);
app.use(promotionRoute);

const producttypeRoute = require('./routes/producttype')(db);
app.use(producttypeRoute);

const productRoute = require('./routes/product')(db);
app.use(productRoute);

const setpromotionRoute = require('./routes/setpromotion')(db);
app.use(setpromotionRoute);

const puchaseoderRoute = require('./routes/puchaseoder')(db);
app.use(puchaseoderRoute);

const oderRoute = require('./routes/oder')(db);
app.use(oderRoute);

const menudetailRoute = require('./routes/menudetail')(db);
app.use(menudetailRoute);

app.listen(port, () => {
    console.log('listening')
});
