// Assuming this is part of the existing module.exports function
const express = require('express');
const router = express.Router();

module.exports = (db) => {
    const router = express.Router();
  
    // Get all menu data
    router.get("/menu_data", (req, res) => {
      const sql = "SELECT menu_data_id, menu_detail_data FROM menu_data_tb";
      
      db.query(sql, (err, result) => {
        if (err) {
          console.error(err);
          return res.status(500).json({ message: "Server Error", error: err.message });
        }
        
        return res.json(result);
      });
    });
  
    // Get menu data by ID
    router.get("/menu_data/:menu_data_id", (req, res) => {
      const menu_data_id = req.params.menu_data_id;
      
      if (!menu_data_id) {
        return res.status(400).json({ message: "Menu Data ID is required" });
      }
  
      const sql = "SELECT menu_data_id, menu_detail_data FROM menu_data_tb WHERE menu_data_id = ?";
      
      db.query(sql, [menu_data_id], (err, result) => {
        if (err) {
          console.error(err);
          return res.status(500).json({ message: "Server Error", error: err.message });
        }
  
        if (result.length > 0) {
          return res.json(result[0]);
        } else {
          return res.status(404).json({ message: "Menu Data not found" });
        }
      });
    });
  
    // Register a new menu data
    router.post("/menu_data_register", (req, res) => {
      const { menu_detail_data } = req.body;
      
      if (!menu_detail_data) {
        return res.status(400).json({ message: "Menu Detail Data is required" });
      }
  
      const sql = "INSERT INTO menu_data_tb (menu_detail_data) VALUES (?)";
      
      db.query(sql, [menu_detail_data], (err, result) => {
        if (err) {
          console.error(err);
          return res.status(500).json({ message: "Server Error", error: err.message });
        }
        
        return res.status(201).json({ message: "Menu Data created successfully", menuDataId: result.insertId });
      });
    });
  
    // Update menu data
    router.put("/edit_menu_data/:menu_data_id", (req, res) => {
      const menu_data_id = req.params.menu_data_id;
      const { menu_detail_data } = req.body;
  
      if (!menu_detail_data) {
        return res.status(400).json({ message: "Menu Detail Data is required" });
      }
  
      const sql = "UPDATE menu_data_tb SET menu_detail_data = ? WHERE menu_data_id = ?";
      
      db.query(sql, [menu_detail_data, menu_data_id], (err, result) => {
        if (err) {
          console.error(err);
          return res.status(500).json({ message: "Server Error", error: err.message });
        }
  
        return res.json({ message: "Menu Data updated successfully" });
      });
    });
  
    // Delete menu data by ID
    router.delete("/delete_menu_data/:menu_data_id", (req, res) => {
      const menu_data_id = req.params.menu_data_id;
  
      if (!menu_data_id) {
        return res.status(400).json({ message: "Menu Data ID is required" });
      }
  
      const sql = "DELETE FROM menu_data_tb WHERE menu_data_id = ?";
      
      db.query(sql, [menu_data_id], (err, result) => {
        if (err) {
          console.error(err);
          return res.status(500).json({ message: "Server Error", error: err.message });
        }
  
        if (result.affectedRows > 0) {
          return res.json({ message: "Menu Data deleted successfully" });
        } else {
          return res.status(404).json({ message: "Menu Data not found" });
        }
      });
    });
  
    // Bulk delete menu data
    router.delete('/bulk_delete_menu_data', (req, res) => {
      const { ids } = req.body;
      if (!Array.isArray(ids) || ids.length === 0) {
        return res.status(400).json({ message: "Invalid or empty list of IDs" });
      }
  
      const sql = `DELETE FROM menu_data_tb WHERE menu_data_id IN (?)`;
      db.query(sql, [ids], (err, result) => {
        if (err) {
          console.error(err);
          return res.status(500).json({ message: "Server Error", error: err.message });
        }
  
        if (result.affectedRows > 0) {
          return res.json({ message: "Menu Data deleted successfully" });
        } else {
          return res.status(404).json({ message: "No Menu Data found to delete" });
        }
      });
    });
  
    return router;
  };
  