const express = require('express');
const router = express.Router();

// Export a function that accepts the db connection
module.exports = (db) => {

  router.get("/compostores/:storeId/status/:compo_status_id", (req, res) => {
    const storeId = req.params.storeId;
    const compo_status_id = req.params.compo_status_id;

    if (!storeId || !compo_status_id) {
        return res.status(400).json({ message: "Store ID and compostore status ID are required" });
    }

    const sql = `
      SELECT 
        compo.*,
        s.user_id, s.logo, s.storeName, s.storeType, s.storeDes, s.style, s.province, s.phone, s.address, s.status AS store_status
      FROM compostore_tb compo
      JOIN stores s ON compo.storeId = s.storeId
      WHERE compo.storeId = ? AND compo.compo_status_id = ?`;
    
    db.query(sql, [storeId, compo_status_id], (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Server Error", error: err.message });
        }
    
        if (result.length > 0) {
            return res.json(result);
        } else {
            return res.status(404).json({ message: "Compostores not found for this store with the given status" });
        }
    });
});


  // Get compostores by store ID
  router.get("/compostores/:storeId", (req, res) => {
    const storeId = req.params.storeId;
    if (!storeId) {
      return res.status(400).json({ message: "Store ID is required" });
    }

    const sql = `
      SELECT 
        compo.*,
        s.user_id, s.logo, s.storeName, s.storeType, s.storeDes, s.style, s.province, s.phone, s.address, s.status AS store_status
      FROM compostore_tb compo
      JOIN stores s ON compo.storeId = s.storeId
      WHERE compo.storeId = ?`;
    
    db.query(sql, [storeId], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error", error: err.message });
      }
    
      if (result.length > 0) {
        return res.json(result);
      } else {
        return res.status(404).json({ message: "Compostores not found for this store" });
      }
    });
  });
  
  // Get a compostore by ID
  router.get("/compostore/:compostore_id", (req, res) => {
    const compostore_id = req.params.compostore_id;
    if (!compostore_id) {
      return res.status(400).json({ message: "Compostore ID is required" });
    }

    const sql = "SELECT * FROM `compostore_tb` WHERE compostore_id = ?";
    
    db.query(sql, [compostore_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error", error: err.message });
      }

      if (result.length > 0) {
        return res.json(result[0]);
      } else {
        return res.status(404).json({ message: "Compostore not found" });
      }
    });
  });

  router.get("/compostore/search/:search", (req, res) => {
    const search = req.params.search;
  
    if (!search) {
      return res.status(400).json({ message: "Search parameter is required" });
    }
  
    // ค้นหาทั้ง compostore_id หรือ compostore_name
    const sql = `
      SELECT * FROM compostore_tb 
      WHERE compostore_id = ? 
      OR compostore_name LIKE ?
    `;
  
    db.query(sql, [search, `%${search}%`], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error", error: err.message });
      }
  
      if (result.length > 0) {
        return res.json(result);
      } else {
        return res.status(404).json({ message: "Compostore not found" });
      }
    });
  });
  
  
  

  // Register a new compostore
  router.post("/compostore_register", (req, res) => {
    const { compostore_name, compo_status_id, storeId } = req.body;
    
    if (!compostore_name || !compo_status_id || !storeId) {
      return res.status(400).json({ message: "Missing required fields" });
    }

    // Check if the compostore_name already exists
    const checkSql = `
      SELECT * FROM compostore_tb WHERE compostore_name = ? AND storeId = ?
    `;
    const checkValues = [compostore_name, storeId];
  
    db.query(checkSql, checkValues, (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error", error: err.message });
      }
  
      if (result.length > 0) {
        return res.status(409).json({ message: "Compostore already exists" });
      } else {
        // If not exists, insert the new record
        const insertSql = `
          INSERT INTO compostore_tb (compostore_name, compo_status_id, storeId)
          VALUES (?, ?, ?)
        `;
        const insertValues = [compostore_name, compo_status_id, storeId];
  
        db.query(insertSql, insertValues, (err, result) => {
          if (err) {
            console.error(err);
            return res.status(500).json({ message: "Server Error", error: err.message });
          }
  
          return res.status(201).json({ message: "Compostore created successfully", compostoreId: result.insertId });
        });
      }
    });
  });
  

  // Update a compostore
  // Update compostore based on status, storeId, and compostore_name
// Update compostore based on status, storeId, and compostore_name
router.put("/editcompostore/status/:status/compos/:compostore_id", (req, res) => {
  const status = req.params.status;
  const compostore_id = req.params.compostore_id;

  if (!status || !compostore_id) {
    return res.status(400).json({ message: "Missing required fields" });
  }

  const sql = `
    UPDATE compostore_tb
    SET compo_status_id = ?
    WHERE compostore_id = ?
  `;
  const values = [status, compostore_id];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Server Error", error: err.message });
    }

    // Check if any rows were affected
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Compostore not found or no changes made" });
    }

    return res.json({ message: "Compostore updated successfully" });
  });
});

// Update or add new compostore with status 2
router.put("/editcompos/:storeId/compos/:compostoreName", (req, res) => {
  const storeId = req.params.storeId;
  const compostoreName = req.params.compostoreName;

  const sql = `
    INSERT INTO compostore_tb (compo_status_id, storeId, compostore_name)
    VALUES (2, ?, ?)
    ON DUPLICATE KEY UPDATE compo_status_id = 2
  `;
  const values = [storeId, compostoreName];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Server Error", error: err.message });
    }
    return res.json({ message: "Compostore updated or added with status 2" });
  });
});



  router.put("/edit_compostore/:compostore_id", (req, res) => {
    const compostore_id = req.params.compostore_id;
    const { compostore_name, compo_status_id, storeId } = req.body;

    if (!compostore_name || !compo_status_id || !storeId) {
      return res.status(400).json({ message: "Missing required fields" });
    }

    const sql = `
      UPDATE compostore_tb
      SET compostore_name=?, compo_status_id=?, storeId=?
      WHERE compostore_id = ?
    `;
    const values = [compostore_name, compo_status_id, storeId, compostore_id];

    db.query(sql, values, (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error", error: err.message });
      }
      return res.json({ message: "Compostore updated successfully" });
    });
  });

  // Delete a compostore
  router.delete("/delete_compostore/:compostore_id", (req, res) => {
    const compostore_id = req.params.compostore_id;

    if (!compostore_id) {
      return res.status(400).json({ message: "Compostore ID is required" });
    }

    const sql = "DELETE FROM compostore_tb WHERE compostore_id = ?";

    db.query(sql, [compostore_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error", error: err.message });
      }

      if (result.affectedRows > 0) {
        return res.json({ message: "Compostore deleted successfully" });
      } else {
        return res.status(404).json({ message: "Compostore not found" });
      }
    });
  });

  // Bulk delete compostores
  router.delete('/bulk_delete_compostores', (req, res) => {
    const { ids } = req.body;
    if (!Array.isArray(ids) || ids.length === 0) {
      return res.status(400).json({ message: "Invalid or empty list of IDs" });
    }

    const sql = `DELETE FROM compostore_tb WHERE compostore_id IN (?)`;
    db.query(sql, [ids], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error", error: err.message });
      }

      if (result.affectedRows > 0) {
        return res.json({ message: "Compostores deleted successfully" });
      } else {
        return res.status(404).json({ message: "No compostores found to delete" });
      }
    });
  });

  return router;
};
