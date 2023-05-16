const express = require("express") ; 
const app = express();
const port = 8080 || process.env.PORT
const cors = require('cors')
const bodyParser = require('body-parser')
const db = require('./configuration/db')
const mongoose = require('mongoose')


/*const MongoClient = require('mongodb').MongoClient;
var database*/
mongoose.connect("mongodb://localhost:27017/mydb",{ useNewUrlParser: true , useUnifiedTopology: true} );

/*MongoClient.connect("mongodb://localhost:27017/mydb",{ useNewUrlParser: true , useUnifiedTopology: true} , (error,result) => {
    if (error) throw error 
    database = result.db('mydb')
    console.log('success')
})
mongoose.Promise = global.Promise;




app.get('/' , (req,res) => {
    res.send('welcome to mongodb api')
})

app.get('/temp_hum' , (req,res) => {
    database.collection('books').find({}).toArray((err,result) => {
      if (err) throw err 
      res.send(result)
    })
})


*/
app.use(cors())
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())
app.use('/',require('./routes/user.route'))
//app.use('dht11' , require('./routes/dht11.route'));
app.listen(port,()=> {
    console.log("port running on " + port) ;
})

