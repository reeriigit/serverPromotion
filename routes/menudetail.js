const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

module.exports = (db) => {
  const router = express.Router();

  router.use(cors());
  router.use(express.json());
  router.use(bodyParser.json());
  router.use(bodyParser.urlencoded({ extended: true }));

  // Get menu detail by ID
  router.get('/get_menu_detail/:menu_detail_id', (req, res) => {
    const menu_detail_id = req.params.menu_detail_id;

    const sql = `
      SELECT * FROM menu_detail_tb
      WHERE menu_detail_id = ?`;

    db.query(sql, [menu_detail_id], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }

      res.json(results);
    });
  });

  // Get menu details by product type ID
  router.get('/menu_detail/:product_type_id', (req, res) => {
    const product_type_id = req.params.product_type_id;

    const sql = `
      SELECT * FROM menu_detail_tb
      WHERE product_type_id = ?
      ORDER BY menu_detail_id DESC`;

    db.query(sql, [product_type_id], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }

      res.json(results);
    });
  });

  // Insert a new menu detail
  router.post('/insertMenuDetail', (req, res) => {
    const { product_type_id, menu_detail_name } = req.body;

    const sql = `INSERT INTO menu_detail_tb (product_type_id, menu_detail_name) VALUES (?, ?)`;
    const values = [product_type_id, menu_detail_name];

    db.query(sql, values, (error, results) => {
      if (error) {
        console.error('Error inserting data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }

      res.json({ message: 'Data inserted successfully' });
    });
  });

  // Delete a menu detail
  router.delete('/deleteMenuDetail/:menu_detail_id', (req, res) => {
    const menu_detail_id = req.params.menu_detail_id;

    const sql = `
      DELETE FROM menu_detail_tb
      WHERE menu_detail_id = ?`;

    db.query(sql, [menu_detail_id], (error, results) => {
      if (error) {
        console.error('Error deleting data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }

      res.json({ message: 'Data deleted successfully' });
    });
  });

  // Update a menu detail
  router.put('/updateMenuDetail/:menu_detail_id', (req, res) => {
    const menu_detail_id = req.params.menu_detail_id;
    const { product_type_id, menu_detail_name } = req.body;

    const sql = `
      UPDATE menu_detail_tb
      SET product_type_id = ?, menu_detail_name = ?
      WHERE menu_detail_id = ?`;

    const values = [product_type_id, menu_detail_name, menu_detail_id];

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
