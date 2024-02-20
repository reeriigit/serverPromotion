const express = require('express')
const mysql = require('mysql')
const cors = require('cors')
const path = require('path')

const app = express()

app.use(express.static(path.join(__dirname,"public")))
app.use(cors())
app.use(express.json())

const port = 5000

const db = mysql.createConnection({
    host:"localhost",
    user: "root",
    password: "",
    database: "students"
})

app.post('/add_store',(req,res)=>{
    sql = 'INSERT INTO `stores`(`storeName`, `storetype`, `storeDes`, `email`, `pass`, `phone`, `address`) VALUES (?,?,?,?,?,?,?)';
    const values = [
        req.body.storeName,
        req.body.storeType,
        req.body.storeDes,
        req.body.email,
        req.body.pass,
        req.body.phone,
        req.body.address,
    ]
    db.query(sql,values,(err,result)=>{
        if(err) return res.json({message: 'Something unesxpected has occured '+ err})
        return res.json({success: "Student added successfully"})
    })
})

app.get("/stores",(req,res)=>{
    const sql = "SELECT * FROM `stores`";
    db.query(sql,(err,result)=>{
        if(err) res.json({message: "Server Error"});
        return res.json(result)
    })
})

app.get("/get_stores/:storeId", (req, res) => {
    const storeId = req.params.storeId;
    const sql = "SELECT * FROM `stores` WHERE `storeId` = ?";
    db.query(sql, [storeId], (err, result) => {
        if (err) res.json({ message: "Server Error" });
        return res.json(result);
    });
});

app.put("/edit_stores/:storeId", (req, res) => {
    const storeId = req.params.storeId;
    const sql = "UPDATE `stores` SET `storeName`=?, `storeType`=?, `storeDes`=?, `email`=?, `pass`=?, `phone`=?, `address`=? WHERE `storeId` = ?";
    const values = [
        req.body.storeName,
        req.body.storeType,
        req.body.storeDes,
        req.body.email,
        req.body.pass,
        req.body.phone,
        req.body.address,
        storeId
    ];

    db.query(sql, values, (err, result) => {
        if (err) return res.json({ message: "Server Error" });
        return res.json(result);
    });
});

app.delete("/delete_stores/:storeId", (req, res) => {
    const storeId = req.params.storeId;
    const sql = "DELETE FROM `stores` WHERE `storeId`=?";
    const values = [storeId];
    db.query(sql, values, (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Server Error" });
        }
        // Check if any rows were affected, indicating a successful deletion
        if (result.affectedRows > 0) {
            return res.status(204).send(); // No Content
        } else {
            return res.status(404).json({ message: "Store not found" });
        }
    });
});




app.listen(port,()=>{
    console.log('listening')
})