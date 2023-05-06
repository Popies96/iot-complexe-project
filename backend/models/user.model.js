const mongoose = require ('mongoose')
const Schema = mongoose.Schema

const newschema = new Schema({
    username:String,
    password:String
})

module.exports = mongoose.model('user' , newschema)