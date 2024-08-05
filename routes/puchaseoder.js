const express = require('express');
const router = express.Router();

// Export a function that accepts the db connection
module.exports = (db) => {

  router.put('/edit_puchaseoder/status/:puchaseoder_id', (req, res) => {
    const { puchaseoder_id } = req.params;
    const { puoder_status_id } = req.body;
  
    const sql = `
      UPDATE puchaseoder
      SET puoder_status_id = ?
      WHERE puchaseoder_id = ?
    `;
  
    db.query(sql, [puoder_status_id, puchaseoder_id], (error, results) => {
      if (error) {
        console.error('Error updating purchase order:', error);
        res.status(500).json({ error: 'Failed to update purchase order' });
      } else {
        res.json({ message: 'Purchase order updated successfully' });
      }
    });
  });
  

  router.get("/puchaseoder/user/:user_id/status/:puoder_status_id", (req, res) => {
    const user_id = req.params.user_id;
    const puoder_status_id = req.params.puoder_status_id; // Added puoder_status_id

    // SQL query to join puchaseoder with users and select required fields
    const sql = `
        SELECT p.*, u.user_id, u.referral_code, u.referred_by, u.username, u.email, u.password, u.full_name, u.address, u.phone_number, u.user_type
        FROM puchaseoder p
        JOIN users u ON p.user_id = u.user_id
        WHERE p.user_id = ? AND p.puoder_status_id = ?
    `;

    db.query(sql, [user_id, puoder_status_id], (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Server Error" });
        }

        if (result.length > 0) {
            return res.json(result);
        } else {
            return res.status(404).json({ message: "No purchase orders found for this user with the given status" });
        }
    });
});

router.get("/puchaseoder/store/:storeId/status/:st/search/:q", (req, res) => {
  const storeId = req.params.storeId;
  const searchQuery = req.params.q;
  const searchstatus = req.params.st;

  const sql = `
    SELECT 
      p.puchaseoder_id, p.user_id, p.storeId, p.puchaseoder_date, 
      p.puoder_status_id, p.puchaseoder_ttprice,p.compostore_name,
      u.username
    FROM 
      puchaseoder p
    JOIN 
      users u ON p.user_id = u.user_id
    WHERE 
      p.storeId = ?
      AND p.puoder_status_id = ?
      AND (u.username LIKE ? OR p.puchaseoder_id LIKE ?)
  `;

  // Add % for search
  const searchValue = `%${searchQuery}%`;

  db.query(sql, [storeId, searchstatus, searchValue, searchValue], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Server Error" });
    }

    if (result.length > 0) {
      return res.json(result);
    } else {
      return res.status(404).json({ message: "No purchase orders found for this store" });
    }
  });
});

router.get("/puchaseoder/store/:storeId/status/:st", (req, res) => {
  const storeId = req.params.storeId;
  const searchstatus = req.params.st;

  const sql = `
    SELECT 
      p.puchaseoder_id, p.user_id, p.storeId, p.puchaseoder_date, 
      p.puoder_status_id, p.puchaseoder_ttprice,p.compostore_name,
      u.username
    FROM 
      puchaseoder p
    JOIN 
      users u ON p.user_id = u.user_id
    WHERE 
      p.storeId = ?
      AND p.puoder_status_id = ?
  `;

  // Add % for search

  db.query(sql, [storeId, searchstatus], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Server Error" });
    }

    if (result.length > 0) {
      return res.json(result);
    } else {
      return res.status(404).json({ message: "No purchase orders found for this store" });
    }
  });
});

router.get("/puchaseoder/store/:storeId/search/:q", (req, res) => {
  const storeId = req.params.storeId;
  const searchQuery = req.params.q;


  const sql = `
    SELECT 
      p.puchaseoder_id, p.user_id, p.storeId, p.puchaseoder_date, 
      p.puoder_status_id, p.puchaseoder_ttprice,p.compostore_name,
      u.username
    FROM 
      puchaseoder p
    JOIN 
      users u ON p.user_id = u.user_id
    WHERE 
      p.storeId = ?
      AND (u.username LIKE ? OR p.puchaseoder_id LIKE ?)
  `;

  // Add % for search
  const searchValue = `%${searchQuery}%`;

  db.query(sql, [storeId, searchValue, searchValue], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Server Error" });
    }

    if (result.length > 0) {
      return res.json(result);
    } else {
      return res.status(404).json({ message: "No purchase orders found for this store" });
    }
  });
});




// ตัวอย่างการเรียกใช้งาน API
// http://localhost:3000/puchaseoder/store/96/search/imrons

  router.get("/puchaseoder/store/:storeId", (req, res) => {
    const storeId = req.params.storeId;
    const sql = `
    SELECT 
      p.puchaseoder_id, p.user_id, p.storeId, p.puchaseoder_date, 
      p.puoder_status_id, p.puchaseoder_ttprice, p.compostore_name,
      u.user_id, u.referral_code, u.referred_by, u.username, 
      u.email, u.password, u.full_name, u.address, u.phone_number, u.user_type
    FROM 
      puchaseoder p
    JOIN 
      users u ON p.user_id = u.user_id
    WHERE 
      p.storeId = ?
  `;
    
    db.query(sql, [storeId], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }
  
      if (result.length > 0) {
        return res.json(result);
      } else {
        return res.status(404).json({ message: "No purchase orders found for this store" });
      }
    });
  });
  

  router.get("/puchaseoder/user/:user_id", (req, res) => {
    const user_id = req.params.user_id;
    const sql = "SELECT * FROM `puchaseoder` WHERE user_id = ?";
    
    db.query(sql, [user_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }
  
      if (result.length > 0) {
        return res.json(result);
      } else {
        return res.status(404).json({ message: "No purchase orders found for this user" });
      }
    });
  });
  

  // Get a purchase order by ID
  router.get("/puchaseoder/:puchaseoder_id", (req, res) => {
    const puchaseoder_id = req.params.puchaseoder_id;
    const sql = "SELECT * FROM `puchaseoder` WHERE puchaseoder_id = ?";
    
    db.query(sql, [puchaseoder_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      if (result.length > 0) {
        return res.json(result[0]);
      } else {
        return res.status(404).json({ message: "Purchase order not found" });
      }
    });
  });

  // Register a new purchase order
  router.post("/puchaseoder_register", (req, res) => {
    const { user_id, storeId, puchaseoder_date, puoder_status_id, puchaseoder_ttprice,compostore_name } = req.body;
  
    const sql = `
      INSERT INTO puchaseoder (user_id, storeId, puchaseoder_date, puoder_status_id, puchaseoder_ttprice,compostore_name)
      VALUES (?, ?, ?, ?, ?, ?)
    `;
    const values = [user_id, storeId, puchaseoder_date, puoder_status_id, puchaseoder_ttprice,compostore_name];
  
    db.query(sql, values, (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }
  
      return res.status(201).json({ message: "Purchase order created successfully", puchaseoderId: result.insertId });
    });
  });

  // Update a purchase order
  router.put("/edit_puchaseoder/:puchaseoder_id", (req, res) => {
    const puchaseoder_id = req.params.puchaseoder_id;

    const sql = `
      UPDATE puchaseoder
      SET user_id=?, storeId=?, puchaseoder_date=?, puoder_status_id=?, puchaseoder_ttprice=?,compostore_name=?
      WHERE puchaseoder_id = ?
    `;
    const values = [
      req.body.user_id,
      req.body.storeId,
      req.body.puchaseoder_date,
      req.body.puoder_status_id,
      req.body.puchaseoder_ttprice,
      req.body.compostore_name,
      puchaseoder_id
    ];

    db.query(sql, values, (err, result) => {
      if (err) {
        console.error(err);
        return res.json({ message: "Server Error" });
      }
      return res.json(result);
    });
  });

  // Delete a purchase order
  router.delete("/delete_puchaseoder/:puchaseoder_id", (req, res) => {
    const puchaseoder_id = req.params.puchaseoder_id;
    const sql = "DELETE FROM puchaseoder WHERE puchaseoder_id = ?";

    db.query(sql, [puchaseoder_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      if (result.affectedRows > 0) {
        return res.json({ message: "Purchase order deleted successfully" });
      } else {
        return res.status(404).json({ message: "Purchase order not found" });
      }
    });
  });

  // Get a purchase order status by ID
  router.get("/puchaseoder_status/:puoder_status_id", (req, res) => {
    const puoder_status_id = req.params.puoder_status_id;
    const sql = "SELECT * FROM puchaseoder_status_tb WHERE puoder_status_id = ?";

    db.query(sql, [puoder_status_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      if (result.length > 0) {
        return res.json(result[0]);
      } else {
        return res.status(404).json({ message: "Purchase order status not found" });
      }
    });
  });

  // Get all purchase order statuses
  router.get("/puchaseoder_statuses", (req, res) => {
    const sql = "SELECT * FROM puchaseoder_status_tb";

    db.query(sql, (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      return res.json(result);
    });
  });

  // Delete a purchase order status
  router.delete("/delete_puchaseoder_status/:puoder_status_id", (req, res) => {
    const puoder_status_id = req.params.puoder_status_id;
    const sql = "DELETE FROM puchaseoder_status_tb WHERE puoder_status_id = ?";

    db.query(sql, [puoder_status_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      if (result.affectedRows > 0) {
        return res.json({ message: "Purchase order status deleted successfully" });
      } else {
        return res.status(404).json({ message: "Purchase order status not found" });
      }
    });
  });

  return router;
};
