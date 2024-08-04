const express = require('express');
const router = express.Router();

// Export a function that accepts the db connection
module.exports = (db) => {

  // Get baskets by user ID
  router.get("/baskets/:user_id", (req, res) => {
    const user_id = req.params.user_id;
    const sql = `
      SELECT 
        b.*, 
        sp.set_promotion_id, sp.promo_id, sp.product_id, sp.storeId AS set_promotion_storeId,
        p.images, p.name, p.product_type_id, p.description AS product_description, p.price, p.cost_price, p.status_id, p.storeId AS product_storeId,
        pr.proimage, pr.promo_name, pr.promo_type, pr.promo_dec, pr.amountuse, pr.amountgiven, pr.valuegiven_id, pr.amountcon, pr.valuecon_id, pr.startdate, pr.enddate,
        s.user_id, s.logo, s.storeName, s.storeType, s.storeDes, s.style, s.province, s.phone, s.address, s.status AS store_status
      FROM basket_tb b
      JOIN set_promotion_tb sp ON b.set_promotion_id = sp.set_promotion_id
      JOIN product_tb p ON sp.product_id = p.product_id
      JOIN promotions_tb pr ON sp.promo_id = pr.promo_id
      JOIN stores s ON sp.storeId = s.storeId
      WHERE b.user_id = ?`;
    
    db.query(sql, [user_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }
    
      if (result.length > 0) {
        return res.json(result);
      } else {
        return res.status(404).json({ message: "Baskets not found for this user" });
      }
    });
  });
  
  
  // Get a basket by ID
  router.get("/basket/:basket_id", (req, res) => {
    const basket_id = req.params.basket_id;
    const sql = "SELECT * FROM `basket_tb` WHERE basket_id = ?";
    
    db.query(sql, [basket_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      if (result.length > 0) {
        return res.json(result[0]);
      } else {
        return res.status(404).json({ message: "Basket not found" });
      }
    });
  });

  // Register a new basket
  router.post("/basket_register", (req, res) => {
    const { set_promotion_id, user_id, storeId } = req.body;
  
    // Check if the set_promotion_id already exists
    const checkSql = `
      SELECT * FROM basket_tb WHERE set_promotion_id = ? AND user_id = ? AND storeId = ?
    `;
    const checkValues = [set_promotion_id, user_id, storeId];
  
    db.query(checkSql, checkValues, (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }
  
      if (result.length > 0) {
        return res.status(200).json({ message: "Basket already exists" });
      } else {
        // If not exists, insert the new record
        const insertSql = `
          INSERT INTO basket_tb (set_promotion_id, user_id, storeId)
          VALUES (?, ?, ?)
        `;
        const insertValues = [set_promotion_id, user_id, storeId];
  
        db.query(insertSql, insertValues, (err, result) => {
          if (err) {
            console.error(err);
            return res.status(500).json({ message: "Server Error" });
          }
  
          return res.status(201).json({ message: "Basket created successfully", basketId: result.insertId });
        });
      }
    });
  });
  

  // Update a basket
  router.put("/edit_basket/:basket_id", (req, res) => {
    const basket_id = req.params.basket_id;

    const sql = `
      UPDATE basket_tb
      SET set_promotion_id=?, user_id=?, storeId=?
      WHERE basket_id = ?
    `;
    const values = [
      req.body.set_promotion_id,
      req.body.user_id,
      req.body.storeId,
      basket_id
    ];

    db.query(sql, values, (err, result) => {
      if (err) {
        console.error(err);
        return res.json({ message: "Server Error" });
      }
      return res.json(result);
    });
  });

  // Delete a basket
  router.delete("/delete_basket/:basket_id", (req, res) => {
    const basket_id = req.params.basket_id;
    const sql = "DELETE FROM basket_tb WHERE basket_id = ?";

    db.query(sql, [basket_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      if (result.affectedRows > 0) {
        return res.json({ message: "Basket deleted successfully" });
      } else {
        return res.status(404).json({ message: "Basket not found" });
      }
    });
  });

  return router;
};
