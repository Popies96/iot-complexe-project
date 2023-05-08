const { default: mongoose } = require('mongoose');
const bcrypt = require("bcrypt");
const db = require ('../configuration/db');
const Schema = mongoose.Schema

const newschema = new Schema({
    username:String,
    password:String,
})

newschema.methods.comparePassword = async function(password) {
    try{
      /*  const isMatch = await bcrypt.compare(password,this.password);
        console.log(password , this.password)*/
        const isMatch = password === this.password;
        return isMatch;
    }catch(error){
        throw error;
    }
}

module.exports = db.model('user' , newschema);