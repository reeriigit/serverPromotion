const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

module.exports = (db) => {
  const router = express.Router();

  router.use(cors());
  router.use(express.json());
  router.use(bodyParser.json());
  router.use(bodyParser.urlencoded({ extended: true }));

  // Get all set promotions for a specific store
  router.get('/set_promotions/:storeId', (req, res) => {
    const storeId = req.params.storeId;

    const sql = `
      SELECT set_promotion_id, promo_id, product_id, storeId
      FROM set_promotion_tb
      WHERE storeId = ?
      ORDER BY set_promotion_id DESC`;

    db.query(sql, [storeId], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }

      res.json(results);
    });
  });

  router.get('/set_promotions_join/:storeId', (req, res) => {
    const storeId = req.params.storeId;
  
    const sql = `
      SELECT 
        sp.set_promotion_id, sp.promo_id, sp.product_id, sp.storeId,
        p.images, p.name, p.product_type_id, p.description AS product_description, p.price, p.cost_price, p.status_id,
        pr.proimage, pr.promo_name, pr.promo_type, pr.promo_dec, pr.amountuse, pr.amountgiven, pr.valuegiven_id, pr.amountcon, pr.valuecon_id, pr.startdate, pr.enddate,
        pt.promo_type_name, pt.description AS promo_type_description,
        vg.valuegiven_name,
        vc.valuecon_name
      FROM set_promotion_tb sp
      JOIN product_tb p ON sp.product_id = p.product_id
      JOIN promotions_tb pr ON sp.promo_id = pr.promo_id
      JOIN promotion_type pt ON pr.promo_type = pt.promo_type_id
      JOIN valuegiven_tb vg ON pr.valuegiven_id = vg.valuegiven_id
      JOIN valuecon_tb vc ON pr.valuecon_id = vc.valuecon_id
      WHERE sp.storeId = ?
      ORDER BY sp.set_promotion_id DESC`;
  
    db.query(sql, [storeId], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }
  
      res.json(results);
    });
});

  

  // Get a set promotion by ID
  router.get('/set_promotion/:set_promotion_id', (req, res) => {
    const set_promotion_id = req.params.set_promotion_id;

    const sql = `
      SELECT set_promotion_id, promo_id, product_id, storeId
      FROM set_promotion_tb
      WHERE set_promotion_id = ?`;

    db.query(sql, [set_promotion_id], (error, results) => {
      if (error) {
        console.error('Error fetching data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }

      res.json(results[0]); // Assuming set_promotion_id is unique, return the first (and only) result
    });
  });

  // Insert multiple set promotions
  router.post('/insertSetPromotions', (req, res) => {
    const { promotions } = req.body;

    if (!promotions || !Array.isArray(promotions) || promotions.length === 0) {
      res.status(400).json({ message: 'Invalid data format for promotions' });
      return;
    }

    const sql = `INSERT INTO set_promotion_tb (promo_id, product_id, storeId) VALUES ?`;

    const values = promotions.map((promotion) => [
      promotion.promo_id,
      promotion.product_id,
      promotion.storeId,
    ]);

    db.query(sql, [values], (error, results) => {
      if (error) {
        console.error('Error inserting data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }

      res.json({ message: 'Data inserted successfully' });
    });
  });

  // Delete multiple set promotions by IDs
  router.post('/deleteSetPromotions', (req, res) => {
    const { ids } = req.body;

    if (!ids || !Array.isArray(ids) || ids.length === 0) {
      res.status(400).json({ message: 'Invalid data format for IDs' });
      return;
    }

    const sql = `
      DELETE FROM set_promotion_tb
      WHERE set_promotion_id IN (?)`;

    db.query(sql, [ids], (error, results) => {
      if (error) {
        console.error('Error deleting data:', error);
        res.status(500).send('Internal Server Error');
        return;
      }

      res.json({ message: 'Data deleted successfully' });
    });
  });

  // Update a set promotion by ID
  router.put('/updateSetPromotion/:set_promotion_id', (req, res) => {
    const set_promotion_id = req.params.set_promotion_id;
    const { promo_id, product_id, storeId } = req.body;

    const sql = `
      UPDATE set_promotion_tb
      SET promo_id = ?, product_id = ?, storeId = ?
      WHERE set_promotion_id = ?`;

    const values = [promo_id, product_id, storeId, set_promotion_id];

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
