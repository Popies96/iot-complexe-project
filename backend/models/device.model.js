const { default: mongoose } = require('mongoose');
const db = require ('../configuration/db');
const Schema = mongoose.Schema

const newschema = new Schema({
    name : String,
    id: String,
    value : Number,
    data :Array
})
const model = db.model('device' , newschema);


newschema.methods.getData = async (id) => { 
    return await model.findById(id).then(res => { 
        return res.data;
    })
}

module.exports = db.model('device' , newschema);