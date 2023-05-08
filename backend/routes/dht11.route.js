const express = require('express');
const router = express.Router;

router.get('/Temp', function(req,res){
    res.send({type : "GET"});
});

router.get('/Hum', function(req,res){
    res.send({type : "GET"});
});