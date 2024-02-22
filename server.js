const express = require('express')
const mysql = require('mysql')
const cors = require('cors')
const multer = require('multer')
const path = require('path')

const app = express()

app.use(express.static(path.join(__dirname,"public")))
app.use(cors())
app.use(express.json())

const port = 5000



const db = mysql.createConnection({
    host:"localhost",
    user: "root",
    password: "",
    database: "students"
})

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
      const { storeName, storeType, storeDes, email, pass, phone, address } = req.body;
  
      // Check if req.file exists and has a valid filename
      if (!req.file || !req.file.filename) {
          return res.status(400).json({ message: 'No valid file uploaded' });
      }
  
      // Use the file path obtained from Multer
      const logo = req.file.filename;
  
      console.log('Uploaded image path:', logo);  // Log the uploaded image path
  
      const sql = 'INSERT INTO `stores`(`logo`,`storeName`, `storeType`, `storeDes`, `email`, `pass`, `phone`, `address`) VALUES (?,?,?,?,?,?,?,?)';
      const values = [
          logo,
          storeName,
          storeType,
          storeDes,
          email,
          pass,
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
  




app.get("/stores",(req,res)=>{
    const sql = "SELECT * FROM `stores`";
    db.query(sql,(err,result)=>{
        if(err) res.json({message: "Server Error"});
        return res.json(result)
    })
})

app.get("/get_stores/:storeId", (req, res) => {
    const storeId = req.params.storeId;
    const sql = "SELECT * FROM `stores` WHERE `storeId` = ?";
    db.query(sql, [storeId], (err, result) => {
        if (err) res.json({ message: "Server Error" });
        return res.json(result);
    });
});

app.get("/get_stores_check/:email/:pass", (req, res) => {
    const email= req.params.email;
    const pass = req.params.pass;
    const sql = "SELECT * FROM `stores` WHERE `email` = ? AND `pass`=?";
    db.query(sql, [email,pass], (err, result) => {
        if (err) res.json({ message: "Server Error" });
        return res.json(result);
    });
});

app.put("/edit_stores/:storeId", upload.single('logo'), (req, res) => {
    const storeId = req.params.storeId;
    

    let logoPath = ""; // Initialize the logoPath

    // Check if a new image is provided
    if (req.file) {
        // If a new image is provided, update the logoPath
        logoPath = req.file.filename;
    }

    console.log('Updated image path:', logoPath);  // Log the updated image path

    const sql = "UPDATE `stores` SET `logo`=?, `storeName`=?, `storeType`=?, `storeDes`=?, `email`=?, `pass`=?, `phone`=?, `address`=? WHERE `storeId` = ?";
    const values = [
        logoPath, // Use the updated logoPath
        req.body.storeName,
        req.body.storeType,
        req.body.storeDes,
        req.body.email,
        req.body.pass,
        req.body.phone,
        req.body.address,
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
//////////table mulimagestb 
const uploadmulfile = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'public/mulimages'); // ระบุโฟลเดอร์ที่จะเก็บรูปภาพ
    },
    filename: function (req, file, cb) {
      const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
      cb(null, file.fieldname + '-' + uniqueSuffix + path.extname(file.originalname));
    }
  });
  
  const uploadmulimages = multer({ storage: uploadmulfile });

app.post('/add_mulimages', uploadmulimages.array('mulimages', 15), (req, res) => {
    const { storeId } = req.body;
    const mulimages = req.files.map(file => file.filename);
  
    console.log('Uploaded image paths:', mulimages);
  
    const sql = 'INSERT INTO `mulimagestb`(`storeId`, `mulimages`) VALUES (?, ?)';
    const values = [
      storeId,
      mulimages.join(','), // Join the array of image filenames into a comma-separated string
    ];
  
    db.query(sql, values, (err, result) => {
      if (err) return res.json({ message: 'Something unexpected has occurred ' + err });
      return res.json({ success: "Images added successfully" });
    });
  });

//////////table mulimagestb END 


app.listen(port,()=>{
    console.log('listening')
})