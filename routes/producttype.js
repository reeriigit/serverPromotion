const express = require('express');
const multer = require('multer');
const path = require('path');
const cors = require('cors');
const bodyParser = require('body-parser');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, './public/producttypeimages/');
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + '-' + file.originalname);
  },
});

const upload = multer({ storage: storage });

module.exports = (db) => {
  const router = express.Router();

  router.use(cors());
  router.use(express.json());
  router.use(bodyParser.json());
  router.use(bodyParser.urlencoded({ extended: true }));

  router.get('/get_producttype/:product_type_id', (req, res) => {
    const product_type_id = req.params.product_type_id;

    const sql = `
      SELECT * FROM product_type_tb
      WHERE product_type_id = ?`;

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
      ORDER BY product_type_id DESC`;

    db.query(sql, [storeId], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }

      res.json(results);
    });
  });

  router.post('/insertProductType', upload.single('product_type_image'), (req, res) => {
    const { storeId, product_type_name, description } = req.body;
    const product_type_image = req.file.filename;

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

  router.put('/updateProductType/:product_type_id', upload.single('product_type_image'), (req, res) => {
    const product_type_id = req.params.product_type_id;
    const { storeId, product_type_name, description } = req.body;

    let product_type_image = req.body.product_type_image;
    if (req.file) {
      product_type_image = req.file.filename;
    }

    const sql = `
      UPDATE product_type_tb
      SET storeId = ?, product_type_name = ?, product_type_image = ?, description = ?
      WHERE product_type_id = ?`;

    const values = [storeId, product_type_name, product_type_image, description, product_type_id];

    db.query(sql, values, (error, results) => {
      if (error) {
        console.error('Error updating data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }

      res.json({ message: 'Data updated successfully' });
    });
  });

  return router;
};
