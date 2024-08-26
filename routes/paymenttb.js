const express = require('express');
const path = require('path');
const cors = require('cors');
const bodyParser = require('body-parser');

module.exports = (db) => {
  const router = express.Router();

  // Apply middleware
  router.use(cors());
  router.use(express.json());
  router.use(bodyParser.json());
  router.use(bodyParser.urlencoded({ extended: true }));

  // Insert a new payment record
  router.post('/insertPayment', (req, res) => {
    const { total_price, payment_type_id, puchaseoder_id, payment_date, payment_time ,incomemoney } = req.body;

    const sql = `
      INSERT INTO payment_tb (total_price, payment_type_id, puchaseoder_id, payment_date, payment_time, incomemoney)
      VALUES (?, ?, ?, ?, ? , ?)`;

    const values = [total_price, payment_type_id, puchaseoder_id, payment_date, payment_time ,incomemoney];

    db.query(sql, values, (error, results) => {
      if (error) {
        console.error('Error inserting data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.json({ message: 'Payment record inserted successfully', paymentId: results.insertId });
    });
  });

  // Update a payment record by ID
  router.put('/updatePayment/:payment_id', (req, res) => {
    const payment_id = req.params.payment_id;
    const { total_price, payment_type_id, puchaseoder_id, payment_date, payment_time, incomemoney } = req.body;
    
    const sql = `
      UPDATE payment_tb
      SET total_price = ?, payment_type_id = ?, puchaseoder_id = ?, payment_date = ?, payment_time = ? , incomemoney = ?
      WHERE payment_id = ?`;

    const values = [total_price, payment_type_id, puchaseoder_id, payment_date, payment_time, incomemoney, payment_id];

    db.query(sql, values, (error, results) => {
      if (error) {
        console.error('Error updating data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.json({ message: 'Payment record updated successfully' });
    });
  });

  // Delete a payment record by ID
  router.delete('/deletePayment/:payment_id', (req, res) => {
    const payment_id = req.params.payment_id;

    const sql = `
      DELETE FROM payment_tb
      WHERE payment_id = ?`;

    db.query(sql, [payment_id], (error, results) => {
      if (error) {
        console.error('Error deleting data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.json({ message: 'Payment record deleted successfully' });
    });
  });

  // Get a payment record by ID
  router.get('/getPayment/:payment_id', (req, res) => {
    const payment_id = req.params.payment_id;

    const sql = `
      SELECT payment_id, total_price, payment_type_id, puchaseoder_id, payment_date, payment_time ,incomemoney
      FROM payment_tb
      WHERE payment_id = ?`;

    db.query(sql, [payment_id], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      if (results.length === 0) {
        return res.status(404).json({ error: 'Payment record not found' });
      }

      res.json(results[0]);
    });
  });

  // Get all payment records by payment type ID
  router.get('/paymentsByType/:payment_type_id', (req, res) => {
    const payment_type_id = req.params.payment_type_id;

    const sql = `
      SELECT payment_id, total_price, payment_type_id, puchaseoder_id, payment_date, payment_time ,incomemoney
      FROM payment_tb
      WHERE payment_type_id = ?
      ORDER BY payment_id DESC`;

    db.query(sql, [payment_type_id], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.json(results);
    });
  });

  return router;
};
