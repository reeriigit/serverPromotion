const express = require('express');
const multer = require('multer');
const path = require('path');
const cors = require('cors');
const bodyParser = require('body-parser');

// Configuration for storing images
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, './public/productimages/'); // Specify the destination folder for storing images
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + '-' + file.originalname); // Define the filename (timestamp + original name)
  },
});

const upload = multer({ storage: storage });

module.exports = (db) => {
  const router = express.Router();

  router.use(cors());
  router.use(express.json());
  router.use(bodyParser.json());
  router.use(bodyParser.urlencoded({ extended: true }));

  // Insert a new product with images
  // Insert a new product with images
router.post('/insertProduct', upload.array('images', 10), (req, res) => {
    const { name, product_type_id, description, price, quantity_in_stock, status_id, storeId } = req.body;
    const images = req.files.map(file => file.filename); // Get array of uploaded filenames
  
    const sql = `
      INSERT INTO product_tb (images, name, product_type_id, description, price, quantity_in_stock, status_id, storeId)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
  
    const values = [ JSON.stringify(images),name, product_type_id, description, price, quantity_in_stock, status_id, storeId];
  
    db.query(sql, values, (error, results) => {
      if (error) {
        console.error('Error inserting data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }
  
      res.json({ message: 'Data inserted successfully' });
    });
  });
  

  // Update a product by ID, including handling product images
  // Update a product by ID, including handling product images
router.put('/updateProduct/:product_id', upload.array('images', 10), (req, res) => {
    const product_id = req.params.product_id;
    const { name, product_type_id, description, price, quantity_in_stock, status_id, promo_id, storeId } = req.body;
  
    let images = req.files.map(file => file.filename); // Updated product images from upload
  
    const sql = `
      UPDATE product_tb
      SET name = ?, product_type_id = ?, description = ?, price = ?, quantity_in_stock = ?, status_id = ?, storeId = ?, images = ?
      WHERE product_id = ?`;
  
    const values = [name, product_type_id, description, price, quantity_in_stock, status_id, storeId, JSON.stringify(images), product_id];
  
    db.query(sql, values, (error, results) => {
      if (error) {
        console.error('Error updating data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }
  
      res.json({ message: 'Data updated successfully' });
    });
  });
  

  // Delete a product by ID
 // Delete a product by ID
router.delete('/deleteProduct/:product_id', (req, res) => {
    const product_id = req.params.product_id;
  
    const sql = `
      DELETE FROM product_tb
      WHERE product_id = ?`;
  
    db.query(sql, [product_id], (error, results) => {
      if (error) {
        console.error('Error deleting data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }
  
      res.json({ message: 'Data deleted successfully' });
    });
  });
  

  // Get a product by ID
  // Get a product by ID
router.get('/get_product/:product_id', (req, res) => {
    const product_id = req.params.product_id;
  
    const sql = `
      SELECT product_id, images, name, product_type_id, description, price, quantity_in_stock, status_id, storeId
      FROM product_tb
      WHERE product_id = ?`;
  
    db.query(sql, [product_id], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }
  
      res.json(results);
    });
  });
  
  // Get all products by store ID
  // Get all products by store ID
router.get('/products/:storeId', (req, res) => {
    const storeId = req.params.storeId;
  
    const sql = `
      SELECT product_id, images, name, product_type_id, description, price, quantity_in_stock, status_id, storeId
      FROM product_tb
      WHERE storeId = ?
      ORDER BY product_id DESC`;
  
    db.query(sql, [storeId], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }
  
      res.json(results);
    });
  });
  

  // Fetch all statuses
  // Fetch all statuses
router.get('/statuses', (req, res) => {
    const sql = `
      SELECT status_id, name
      FROM status_pd_tb`;
  
    db.query(sql, (error, results) => {
      if (error) {
        console.error('Error fetching status data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }
  
      res.json(results);
    });
  });
  
  return router;
};
