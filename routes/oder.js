const express = require('express');
const router = express.Router();

// Export a function that accepts the db connection
module.exports = (db) => {

  router.get("/orders/puchaseorder/:puchaseoder_id", (req, res) => {
    const puchaseoder_id = req.params.puchaseoder_id;
    const sql = `
      SELECT 
        o.*, 
        sp.set_promotion_id, sp.promo_id, sp.product_id, sp.storeId AS set_promotion_storeId,
        p.images, p.name, p.product_type_id, p.description AS product_description, p.price, p.cost_price, p.status_id, p.storeId AS product_storeId,
        pr.proimage, pr.promo_name, pr.promo_type, pr.promo_dec, pr.amountuse, pr.amountgiven, pr.valuegiven_id, pr.amountcon, pr.valuecon_id, pr.startdate, pr.enddate
      FROM oder_tb o
      JOIN set_promotion_tb sp ON o.set_promotion_id = sp.set_promotion_id
      JOIN product_tb p ON sp.product_id = p.product_id
      JOIN promotions_tb pr ON sp.promo_id = pr.promo_id
      WHERE o.puchaseoder_id = ?`;
  
    db.query(sql, [puchaseoder_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }
  
      if (result.length > 0) {
        return res.json(result);
      } else {
        return res.status(404).json({ message: "Orders not found for this purchase order" });
      }
    });
  });
  
  // Get an order by ID
  router.get("/oder/:oder_id", (req, res) => {
    const oder_id = req.params.oder_id;
    const sql = "SELECT * FROM `oder_tb` WHERE oder_id = ?";
    
    db.query(sql, [oder_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      if (result.length > 0) {
        return res.json(result[0]);
      } else {
        return res.status(404).json({ message: "Order not found" });
      }
    });
  });

  // Register a new order
  router.post("/oder_register", (req, res) => {
    const { set_promotion_id, totalprice, puchaseoder_id, order_status_id, oder_amount, price, price_setpro } = req.body;

    const sql = `
      INSERT INTO oder_tb (set_promotion_id, totalprice, puchaseoder_id, order_status_id, oder_amount, price, price_setpro)
      VALUES (?, ?, ?, ?, ?, ?, ?)
    `;
    const values = [set_promotion_id, totalprice, puchaseoder_id, order_status_id, oder_amount, price, price_setpro];

    db.query(sql, values, (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      return res.status(201).json({ message: "Order created successfully", oderId: result.insertId });
    });
  });

  // Update an order
  router.put("/edit_oder/:oder_id", (req, res) => {
    const oder_id = req.params.oder_id;

    const sql = `
      UPDATE oder_tb
      SET set_promotion_id=?, totalprice=?, puchaseoder_id=?, order_status_id=?, oder_amount=?, price=?, price_setpro=?
      WHERE oder_id = ?
    `;
    const values = [
      req.body.set_promotion_id,
      req.body.totalprice,
      req.body.puchaseoder_id,
      req.body.order_status_id,
      req.body.oder_amount,
      req.body.price,
      req.body.price_setpro,
      oder_id
    ];

    db.query(sql, values, (err, result) => {
      if (err) {
        console.error(err);
        return res.json({ message: "Server Error" });
      }
      return res.json(result);
    });
  });

  // Delete an order
  router.delete("/delete_oder/:oder_id", (req, res) => {
    const oder_id = req.params.oder_id;
    const sql = "DELETE FROM oder_tb WHERE oder_id = ?";

    db.query(sql, [oder_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      if (result.affectedRows > 0) {
        return res.json({ message: "Order deleted successfully" });
      } else {
        return res.status(404).json({ message: "Order not found" });
      }
    });
  });

  return router;
};
