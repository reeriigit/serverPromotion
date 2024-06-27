const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const multer = require('multer');
const path = require('path');
const cors = require('cors');
const bodyParser = require('body-parser');

router.use(cors());
router.use(express.json());

router.use(bodyParser.json());
router.use(bodyParser.urlencoded({ extended: true }));

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, '../public/proimages/'));
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname));
  }
});

const upload = multer({ storage: storage });

router.use(bodyParser.json());
router.use(bodyParser.urlencoded({ extended: true }));

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "students"
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to MySQL database');
});

router.get('/get_promotions', (req, res) => {
  const sql = 'SELECT * FROM promotions_tb';

  db.query(sql, (error, results) => {
    if (error) {
      console.error('Error fetching data:', error);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json(results);
  });
});

router.get('/promotions/:storeId', (req, res) => {
  const storeId = req.params.storeId;

  const sql = `
    SELECT 
      p.promo_id, 
      p.storeId, 
      p.proimage, 
      p.promo_name, 
      p.promo_type, 
      pt.promo_type_name, 
      p.promo_dec, 
      p.amountuse, 
      p.amountgiven, 
      p.valuegiven_id, 
      vgt.valuegiven_name AS valuegiven_name_tb, 
      p.amountcon, 
      p.valuecon_id, 
      vct.valuecon_name AS valuecon_name_tb, 
      p.startdate, 
      p.enddate 
    FROM promotions_tb p
    LEFT JOIN promotion_type pt ON p.promo_type = pt.promo_type_id
    LEFT JOIN valuecon_tb vct ON p.valuecon_id = vct.valuecon_id
    LEFT JOIN valuegiven_tb vgt ON p.valuegiven_id = vgt.valuegiven_id
    WHERE p.storeId = ?
    ORDER BY p.promo_id DESC`; // Add WHERE clause to filter by storeId

  db.query(sql, [storeId], (error, results) => {
    if (error) {
      console.error('Error fetching data:', error);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json(results);
  });
});



router.get('/promotion/:promo_id', (req, res) => {
  const promoId = req.params.promo_id;

  const sql = `
    SELECT 
      p.promo_id, 
      p.storeId, 
      p.proimage, 
      p.promo_name, 
      p.promo_type, 
      pt.promo_type_name, 
      p.promo_dec, 
      p.amountuse, 
      p.amountgiven, 
      p.valuegiven_id, 
      vgt.valuegiven_name AS valuegiven_name_tb, 
      p.amountcon, 
      p.valuecon_id, 
      vct.valuecon_name AS valuecon_name_tb, 
      p.startdate, 
      p.enddate 
    FROM promotions_tb p
    LEFT JOIN promotion_type pt ON p.promo_type = pt.promo_type_id
    LEFT JOIN valuecon_tb vct ON p.valuecon_id = vct.valuecon_id
    LEFT JOIN valuegiven_tb vgt ON p.valuegiven_id = vgt.valuegiven_id
    WHERE p.promo_id = ?`; // Use a WHERE clause to filter based on promo_id

  db.query(sql, [promoId], (error, results) => {
    if (error) {
      console.error('Error fetching data:', error);
      res.status(500).send('Internal Server Error');
      return;
    }

    if (results.length === 0) {
      // Promotion with the specified ID not found
      res.status(404).send('Promotion not found');
      return;
    }

    const promotion = results[0];
    res.json(promotion);
  });
});
router.get('/get_promotion/:promo_id', (req, res) => {
  const promoId = req.params.promo_id;

  const sql = ` SELECT * FROM promotions_tb WHERE promo_id = ?`; // Use a WHERE clause to filter based on promo_id

  db.query(sql, [promoId], (error, results) => {
    if (error) {
      console.error('Error fetching data:', error);
      return;
    }

    if (results.length === 0) {
      // Promotion with the specified ID not found
      res.status(404).send('Promotion not found');
      return;
    }

    const promotion = results[0];
    res.json(promotion);
  });
});



router.post('/insertPromotion', upload.single('proimage'), (req, res) => {
  const {
    storeId,
    promo_name,
    promo_type,
    promo_dec,
    amountuse,
    amountgiven,
    valuegiven_id,
    amountcon,
    valuecon_id,
    startdate,
    enddate
  } = req.body;

  const proimage = req.file.filename;

  const sql = `INSERT INTO promotions_tb ( storeId, proimage, promo_name, promo_type, promo_dec, amountuse, amountgiven, valuegiven_id, amountcon, valuecon_id, startdate, enddate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

  db.query(sql, [storeId, proimage, promo_name, promo_type, promo_dec, amountuse, amountgiven, valuegiven_id, amountcon, valuecon_id, startdate, enddate], (error, results, fields) => {
    if (error) throw error;
    res.send('Promotion inserted successfully.');
  });
});

router.delete('/deletePromotion/:promotionId', async (req, res) => {
  const promotionId = req.params.promotionId;

  // ตรวจสอบว่า db ถูกกำหนดให้ใช้งาน
  if (!db) {
    return res.status(500).json({ error: 'Internal server error' });
  }

  db.query('DELETE FROM promotions_tb WHERE promo_id = ?', [promotionId], (error, results, fields) => {
    if (error) {
      console.error('Error deleting promotion:', error);
      return res.status(500).json({ success: false, message: 'Internal server error.' });
    }

    if (results.affectedRows > 0) {
      return res.json({ success: true, message: 'Promotion deleted successfully.' });
    } else {
      return res.json({ success: false, message: 'Promotion not found.' });
    }
  });
});



router.put("/update_promotion/:promo_id", upload.single('proimage'), (req, res) => {
  const promo_id = req.params.promo_id;

  
  let proimage = req.body.proimage; // Initialize the logoPath with the existing logo path

  // Check if a new image is provided
  if (req.file) {
      // If a new image is provided, update the logoPath
      proimage = req.file.filename;
  }

  const sql = `
    UPDATE promotions_tb
    SET 
        storeId = ?,
        proimage = ?,
        promo_name = ?,
        promo_type = ?,
        promo_dec = ?,
        amountuse = ?,
        amountgiven = ?,
        valuegiven_id = ?,
        amountcon = ?,
        valuecon_id = ?,
        startdate = ?,
        enddate = ?
    WHERE promo_id = ?
  `;

  const values = [
    req.body.storeId,
    proimage,
    req.body.promo_name,
    req.body.promo_type,
    req.body.promo_dec,
    req.body.amountuse,
    req.body.amountgiven,
    req.body.valuegiven_id,
    req.body.amountcon,
    req.body.valuecon_id,
    req.body.startdate,
    req.body.enddate,
    promo_id
  ];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: " yyyyy Server Error" });
    }
    return res.status(200).json(result);
  });
});


module.exports = router;
