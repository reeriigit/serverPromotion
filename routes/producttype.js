const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const multer = require('multer');
const path = require('path');
const cors = require('cors');
const fs = require('fs');

const app = express();

app.use(cors());
app.use(express.json());

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

router.get('/get_producttype/:product_type_id', (req, res) => {
  const product_type_id = req.params.product_type_id;

  const sql = `
    SELECT * FROM product_type_tb
    WHERE product_type_id = ? `; // Add WHERE clause to filter by storeId

  db.query(sql, [product_type_id], (error, results) => {
    if (error) {
      console.error('Error fetching data:', error);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json(results);
  });
});

router.get('/producttype/:storeId', (req, res) => {
  const storeId = req.params.storeId;

  const sql = `
    SELECT * FROM product_type_tb
    WHERE storeId = ?
    ORDER BY product_type_id  DESC`; // Add WHERE clause to filter by storeId

  db.query(sql, [storeId], (error, results) => {
    if (error) {
      console.error('Error fetching data:', error);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json(results);
  });
});

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, './public/producttypeimages/');
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + '-' + file.originalname);
  },
});

const upload = multer({ storage: storage });

// Endpoint for inserting data with image upload
router.post('/insertProductType', upload.single('product_type_image'), (req, res) => {
  const { storeId, product_type_name, description } = req.body;
  const product_type_image = req.file.filename; // Multer will add this property

  const sql = `INSERT INTO product_type_tb (storeId, product_type_name, product_type_image, description) VALUES (?, ?, ?, ?)`;
  const values = [storeId, product_type_name, product_type_image, description];

  db.query(sql, values, (error, results) => {
    if (error) {
      console.error('Error inserting data:', error);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json({ message: 'Data inserted successfully' });
  });
});

router.delete('/deleteProductType/:product_type_id', (req, res) => {
  const product_type_id = req.params.product_type_id;
  
  if (!db) {
    return res.status(500).json({ error: 'Internal server error' });
  }

  const sql = `
    DELETE FROM product_type_tb
    WHERE product_type_id = ?`;

  db.query(sql, [product_type_id], (error, results) => {
    if (error) {
      console.error('Error deleting data:', error);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json({ message: 'Data deleted successfully' });
  });
});

// Endpoint for updating data
router.put('/updateProductType/:product_type_id', upload.single('product_type_image'), (req, res) => {
  const product_type_id = req.params.product_type_id;
  const { storeId, product_type_name, description } = req.body;

  let product_type_image = null;

  // Check if a new image is provided in the request
  if (req.file) {
    product_type_image = req.file.filename;
  }

  const updateFields = [];
  const values = [];

  if (storeId) {
    updateFields.push('storeId = ?');
    values.push(storeId);
  }

  if (product_type_name) {
    updateFields.push('product_type_name = ?');
    values.push(product_type_name);
  }

  if (product_type_image) {
    updateFields.push('product_type_image = ?');
    values.push(product_type_image);
  }

  if (description) {
    updateFields.push('description = ?');
    values.push(description);
  }

  if (updateFields.length === 0) {
    // No fields to update
    return res.status(400).json({ error: 'No valid fields provided for update' });
  }

  const sql = `
    UPDATE product_type_tb
    SET ${updateFields.join(', ')}
    WHERE product_type_id = ?`;

  values.push(product_type_id);

  db.query(sql, values, (error, results) => {
    if (error) {
      console.error('Error updating data:', error);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json({ message: 'Data updated successfully' });
  });
});



module.exports = router;
