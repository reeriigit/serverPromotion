// Assuming you have 'express' and 'mysql' modules already imported
const express = require('express');
const router = express.Router();
const mysql = require('mysql');

// Create a MySQL connection
const db = mysql.createConnection({
    host:"localhost",
    user: "root",
    password: "",
    database: "students"
});

// Connect to the database
db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to MySQL database');
});

router.get("/users/:userId", (req, res) => {
  const userId = req.params.userId;
  const sql = "SELECT * FROM `users` WHERE user_id = ?";
  
  db.query(sql, [userId], (err, result) => {
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
  const { username, email, password, full_name, address, phone_number, user_type } = req.body;

  // Perform validation if needed

  // Assuming you have a 'users' table in your database
  const sql = `
    INSERT INTO users (username, email, password, full_name, address, phone_number, user_type)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;
  const values = [username, email, password, full_name, address, phone_number, user_type];

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
        // return res.status(200).json({ message: "Login successful" });
        return res.json(result)
      } else {
        // User not found, send an error message
        return res.status(401).json({ message: "Login failed. Invalid credentials." });
      }
    });
  });

module.exports = router;
