/*const MongoClient = require('mongodb').MongoClient;

const url = 'mongodb://localhost:8080/mydb';

exports.readDht = (req, res) => {
  MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    const dbo = db.db("mydb");
    dbo.collection("temp_hum").find({}).toArray(function(err, result) {
      if (err) throw err;
      const formattedResult = result.map(item => {
        return {
          "time_period": item.time_period,
          "month": item.month,
          "meteorological_indicator": item.meteorological_indicator,
          "value": item.value
        }
      });
      res.send(formattedResult);
      db.close();
    });
  });
};

*/