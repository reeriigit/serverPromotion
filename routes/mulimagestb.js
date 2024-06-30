const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');
const fs = require('fs');

const uploadmulfile = multer.diskStorage({
  destination: function (req, file, cb) {
    const uploadPath = path.join(__dirname, '..', 'public', 'mulimages');
    fs.mkdirSync(uploadPath, { recursive: true });  // Create the directory if it doesn't exist
    cb(null, uploadPath);
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, file.fieldname + '-' + uniqueSuffix + path.extname(file.originalname));
  }
});

const uploadmulimages = multer({ storage: uploadmulfile });

module.exports = (db) => {
  router.get("/get_mulimagestb/:storeId", (req, res) => {
    const storeId = req.params.storeId;
    const sql = "SELECT * FROM `mulimagestb` WHERE `storeId` = ?";
    db.query(sql, [storeId], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }
      return res.json(result);
    });
  });

  router.post('/add_mulimages', uploadmulimages.array('mulimages', 15), (req, res) => {
    const { storeId } = req.body;
    const mulimages = req.files.map(file => file.filename);

    console.log('Uploaded image paths:', mulimages);

    const sql = 'INSERT INTO `mulimagestb`(`storeId`, `mulimages`) VALUES (?, ?)';
    const values = [
      storeId,
      mulimages.join(','), // Join the array of image filenames into a comma-separated string
    ];

    db.query(sql, values, (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: 'Something unexpected has occurred ' + err });
      }
      return res.json({ success: "Images added successfully" });
    });
  });

  router.put('/update_mulimages/:storeId', uploadmulimages.array('mulimages', 15), (req, res) => {
    const { storeId } = req.params;
    const updatedMulimages = req.files.map(file => file.filename);

    console.log('Updated image paths:', updatedMulimages);

    const selectSql = 'SELECT * FROM `mulimagestb` WHERE `storeId` = ?';
    db.query(selectSql, [storeId], (selectErr, selectResult) => {
      if (selectErr) {
        console.error(selectErr);
        return res.status(500).json({ message: 'Server Error' });
      }

      if (selectResult.length === 0) {
        return res.status(404).json({ message: 'Store not found' });
      }

      const existingMulimages = selectResult[0].mulimages.split(',');

      // Combine existing and updated images
      const allMulimages = [...existingMulimages, ...updatedMulimages];

      const updateSql = 'UPDATE `mulimagestb` SET `mulimages` = ? WHERE `storeId` = ?';
      const updateValues = [allMulimages.join(','), storeId];

      db.query(updateSql, updateValues, (updateErr, updateResult) => {
        if (updateErr) {
          console.error(updateErr);
          return res.status(500).json({ message: 'Server Error' });
        }

        return res.json({ success: 'Images updated successfully' });
      });
    });
  });

  return router;
};
