const device = require('../models/device.model');

exports.getAllById = async (req, res) => {
  const result = await device.find({ id: req.id });;

  return res.send(result);
};


// Temperature 
/*exports.getValueByIndicator = async (req, res) => {
    const results = await device.find({ meteorological_indicator: 'Temperature Degree Centigrade (°C)' }, { value: 1, _id: 0 });
    const values = results.map(result => result);
    
    for (let i = 0; i < values.length; i++) {
     // res.send(values);
    }
    res.send(values);
    console.log(values)
   
  };*/
  exports.getValueByIndicatorLast = async (req, res) => {
    const results = await device.find({ meteorological_indicator: 'Temperature Degree Centigrade (°C)' });
    const value = results[40].value;
    res.send(`${value}` + '   C°') ;


    };

// Humidity 
/*
exports.getValueByIndicator1 = async (req, res) => {
  const results1 = await device.find({ meteorological_indicator: 'Relative Humidity (%)' }, { value: 1, _id: 0 });
  const values1 = results1.map(result => result);
  
  for (let i = 0; i < values.length; i++) {
   // res.send(values);
  }
  res.send(values1);
  console.log(values1)
 
};*/
exports.getValueByIndicatorLast1 = async (req, res) => {
  const results1 = await device.find({ meteorological_indicator: 'Gas m3' });
  const value1 = results1[6].value;
  res.send(`${value1}` + '   m3') ;


  };

  exports.getValueByIndicatorLast2 = async (req, res) => {
    const results2 = await device.find({ meteorological_indicator: 'Water L' });
    const value2 = results2[2].value;
    res.send(`${value2}` + '   Liter') ;
  
  
    };
    
    exports.getValueByIndicatorLast3 = async (req, res) => {
      const results3 = await device.find({ meteorological_indicator: 'Power W' });
      const value3 = results3[1].value;
      res.send(`${value3}` + '   kWh') ;
    
      };
  
