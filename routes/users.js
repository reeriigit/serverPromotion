const express = require('express');
const router = express.Router();

// Export a function that accepts the db connection
module.exports = (db) => {

  router.get("/users/:user_id", (req, res) => {
    const user_id = req.params.user_id;
    const sql = "SELECT * FROM `users` WHERE user_id = ?";
    
    db.query(sql, [user_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      if (result.length > 0) {
        return res.json(result[0]); // Assuming you want to return a single user
      } else {
        return res.status(404).json({ message: "User not found" });
      }
    });
  });

  // API endpoint to get all users
  router.post("/users_register", (req, res) => {
    const { referral_code,referred_by,username, email, password, full_name, address, phone_number, user_type } = req.body;

    // Perform validation if needed

    // Assuming you have a 'users' table in your database
    const sql = `
      INSERT INTO users (referral_code,referred_by,username, email, password, full_name, address, phone_number, user_type)
      VALUES (?, ?,?, ?, ?, ?, ?, ?, ?)
    `;
    const values = [referral_code,referred_by,username, email, password, full_name, address, phone_number, user_type];

    db.query(sql, values, (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      return res.status(201).json({ message: "User created successfully", userId: result.insertId });
    });
  });

  router.post("/login", (req, res) => {
    const { username, password } = req.body;

    // Assuming you have a 'users' table in your database
    const sql = `
      SELECT * FROM users
      WHERE username = ? AND password = ?
    `;
    const values = [username, password];

    // Make sure that 'db' is defined and represents your MySQL database connection
    db.query(sql, values, (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      if (result.length > 0) {
        // User found, send a success message
        return res.json(result);
      } else {
        // User not found, send an error message
        return res.status(401).json({ message: "Login failed. Invalid credentials." });
      }
    });
  });

  router.get("/users_check/:username/:password", (req, res) => {
    const { username, password } = req.params;

    const sql = `
      SELECT * FROM users
      WHERE username = ? AND password = ?
    `;

    db.query(sql, [username, password], (err, result) => {
      if (err) {
        return res.status(500).json({ message: "Server Error" });
      }
      return res.json(result);
    });
  });

  router.put("/edit_user/:user_id", (req, res) => {
    const user_id = req.params.user_id;

    const sql = "UPDATE `users` SET  `username`=?, `email`=?, `password`=?, `full_name`=?, `address`=?, `phone_number`=? WHERE `user_id` = ?";
    const values = [
        req.body.username,
        req.body.email,
        req.body.password,
        req.body.full_name,
        req.body.address,
        req.body.phone_number,
        user_id
    ];

    db.query(sql, values, (err, result) => {
        if (err) {
            console.error(err);
            return res.json({ message: "Server Error" });
        }
        return res.json(result);
    });
  });

  // New endpoint to check referral code
  router.get("/check_referral_code/:code", (req, res) => {
    const code = req.params.code;
    const sql = "SELECT COUNT(*) as count FROM users WHERE referral_code = ?";

    db.query(sql, [code], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Server Error" });
      }

      const exists = result[0].count > 0;
      return res.json({ exists });
    });
  });

  return router;
};
