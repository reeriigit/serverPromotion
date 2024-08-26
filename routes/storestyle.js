const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

module.exports = (db) => {
  const router = express.Router();

  // Apply middleware
  router.use(cors());
  router.use(express.json());
  router.use(bodyParser.json());
  router.use(bodyParser.urlencoded({ extended: true }));

  // Insert a new store style
  router.post('/insertStoreStyle', (req, res) => {
    const { storestyle_name } = req.body;

    const sql = `
      INSERT INTO storestyle (storestyle_name)
      VALUES (?)`;

    const values = [storestyle_name];

    db.query(sql, values, (error, results) => {
      if (error) {
        console.error('Error inserting data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.json({ message: 'Store style inserted successfully' });
    });
  });

  // Update a store style by ID
  router.put('/updateStoreStyle/:storestyle_id', (req, res) => {
    const storestyle_id = req.params.storestyle_id;
    const { storestyle_name } = req.body;

    const sql = `
      UPDATE storestyle
      SET storestyle_name = ?
      WHERE storestyle_id = ?`;

    const values = [storestyle_name, storestyle_id];

    db.query(sql, values, (error, results) => {
      if (error) {
        console.error('Error updating data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.json({ message: 'Store style updated successfully' });
    });
  });

  // Delete a store style by ID
  router.delete('/deleteStoreStyle/:storestyle_id', (req, res) => {
    const storestyle_id = req.params.storestyle_id;

    const sql = `
      DELETE FROM storestyle
      WHERE storestyle_id = ?`;

    db.query(sql, [storestyle_id], (error, results) => {
      if (error) {
        console.error('Error deleting data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.json({ message: 'Store style deleted successfully' });
    });
  });

  // Get a store style by ID
  router.get('/getStoreStyle/:storestyle_id', (req, res) => {
    const storestyle_id = req.params.storestyle_id;

    const sql = `
      SELECT storestyle_id, storestyle_name
      FROM storestyle
      WHERE storestyle_id = ?`;

    db.query(sql, [storestyle_id], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      if (results.length === 0) {
        return res.status(404).json({ error: 'Store style not found' });
      }

      res.json(results[0]);
    });
  });

  // Get all store styles
  router.get('/storeStyles', (req, res) => {
    const sql = `
      SELECT storestyle_id, storestyle_name
      FROM storestyle
      ORDER BY storestyle_id DESC`;

    db.query(sql, (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.json(results);
    });
  });

  return router;
};
