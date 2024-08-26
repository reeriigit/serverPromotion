const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs'); // Import the fs module
const cors = require('cors');
const bodyParser = require('body-parser');

// Configuration for storing images
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, '../public/paymentchannel/')); // Adjust the path if necessary
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + '-' + file.originalname); // Define the filename (timestamp + original name)
  },
});

const upload = multer({ storage: storage });

module.exports = (db) => {
  const router = express.Router();

  // Apply middleware
  router.use(cors());
  router.use(express.json());
  router.use(bodyParser.json());
  router.use(bodyParser.urlencoded({ extended: true }));

  // Insert a new payment channel with QR image
  router.post('/insertPaymentChannel', upload.single('prom_qr'), (req, res) => {
    const { bankname, status_use, prom_phone, storeId } = req.body;
    const prom_qr = req.file ? req.file.filename : null; // Get the uploaded QR image filename

    const sql = `
      INSERT INTO paymentchannel_tb (bankname, status_use, prom_qr, prom_phone, storeId)
      VALUES (?, ?, ?, ?, ?)`;

    const values = [bankname, status_use, prom_qr, prom_phone, storeId];

    db.query(sql, values, (error, results) => {
      if (error) {
        console.error('Error inserting data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.json({ message: 'Payment channel inserted successfully' });
    });
  });

  // Update a payment channel by ID
  router.put('/updatePaymentChannel/:paymentchannel_id', upload.single('prom_qr'), (req, res) => {
    const paymentchannel_id = req.params.paymentchannel_id;
    const { bankname, status_use, prom_phone, storeId } = req.body;
    
    let sql = `
      UPDATE paymentchannel_tb
      SET bankname = ?, status_use = ?, prom_phone = ?, storeId = ?`;

    const values = [bankname, status_use, prom_phone, storeId];

    // Check if a new QR image is uploaded
    if (req.file) {
      const prom_qr = req.file.filename;
      sql += `, prom_qr = ?`;
      values.push(prom_qr);

      // Fetch the existing QR code filename
      db.query('SELECT prom_qr FROM paymentchannel_tb WHERE paymentchannel_id = ?', [paymentchannel_id], (error, results) => {
        if (error) {
          console.error('Error fetching old QR code filename:', error);
          return res.status(500).json({ error: 'Internal Server Error' });
        }

        const oldPromQr = results[0]?.prom_qr;
        if (oldPromQr) {
          const oldFilePath = path.join(__dirname, '../public/paymentchannel/', oldPromQr);
          fs.unlink(oldFilePath, (err) => {
            if (err) {
              console.error('Error deleting old QR code file:', err);
            }
          });
        }
      });
    }

    sql += ` WHERE paymentchannel_id = ?`;
    values.push(paymentchannel_id);

    db.query(sql, values, (error, results) => {
      if (error) {
        console.error('Error updating data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.json({ message: 'Payment channel updated successfully' });
    });
  });

  // Delete a payment channel by ID
  router.delete('/deletePaymentChannel/:paymentchannel_id', (req, res) => {
    const paymentchannel_id = req.params.paymentchannel_id;

    // First, get the filename of the image associated with the payment channel
    db.query('SELECT prom_qr FROM paymentchannel_tb WHERE paymentchannel_id = ?', [paymentchannel_id], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      if (results.length === 0) {
        return res.status(404).json({ error: 'Payment channel not found' });
      }

      const prom_qr = results[0].prom_qr;

      // Proceed with the deletion of the record
      const sql = `
        DELETE FROM paymentchannel_tb
        WHERE paymentchannel_id = ?`;

      db.query(sql, [paymentchannel_id], (error, results) => {
        if (error) {
          console.error('Error deleting data:', error);
          return res.status(500).json({ error: 'Internal Server Error' });
        }

        // Delete the image file from the filesystem if it exists
        if (prom_qr) {
          const filePath = path.join(__dirname, '../public/paymentchannel/', prom_qr);
          fs.unlink(filePath, (err) => {
            if (err) {
              console.error('Error deleting file:', err);
              return res.status(500).json({ error: 'Internal Server Error' });
            }
          });
        }

        res.json({ message: 'Payment channel deleted successfully' });
      });
    });
  });

  // Get a payment channel by ID
  router.get('/getPaymentChannel/:paymentchannel_id', (req, res) => {
    const paymentchannel_id = req.params.paymentchannel_id;

    const sql = `
      SELECT paymentchannel_id, bankname, status_use, prom_qr, prom_phone, storeId
      FROM paymentchannel_tb
      WHERE paymentchannel_id = ?`;

    db.query(sql, [paymentchannel_id], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      if (results.length === 0) {
        return res.status(404).json({ error: 'Payment channel not found' });
      }

      res.json(results[0]);
    });
  });

  // Get all payment channels by store ID
  router.get('/paymentChannels/:storeId', (req, res) => {
    const storeId = req.params.storeId;

    const sql = `
      SELECT paymentchannel_id, bankname, status_use, prom_qr, prom_phone, storeId
      FROM paymentchannel_tb
      WHERE storeId = ?
      ORDER BY paymentchannel_id DESC`;

    db.query(sql, [storeId], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.json(results);
    });
  });

  return router;
};
