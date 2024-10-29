const express = require('express');
const connection = require('../connection');
const router = express.Router();
var auth = require('../services/authentication');
var checkRole = require('../services/checkRole');

// ADD API
router.post('/add', auth.authenticateToken, checkRole.checkRole, (req,res) => {
    let product = req.body;
    var query = "insert into product (name, categoryId, description, price, status) values(?,?,?,?,'true')";
    connection.query(query,[product.name, product.categoryId, product.description, product.price], (err,results) => {
        if (!err) {
            return res.status(200).json({message: "Product Added Successfully !"});
        } else {
            return res.status(500).json(err);
        }
    })
})

// GET API
router.get('/get', auth.authenticateToken,(req,res,next) => {
    var query = "select p.id, p.name, p.description, p.price, p.status, c.id as categoryId, c.name as categoryName from product as p INNER JOIN category as c where p.category.id = c.id";
    connection.query(query,(err,results) => {
        if (!err) {
            return res.status(200).json(results);
        } else {
            return res.status(500).json(err);
        }
    })
})

module.exports = router;