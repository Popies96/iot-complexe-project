const express = require ('express')
const User = require ('../models/user.model')
const router = express.Router()

router.post('/signup',(req,res)=>{
    User.findOne({username:req.body.username}).then((err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(user==null){
                const user = User({
                    username:req.body.username,
                    password:req.body.password
                })
                user.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(user)
                        res.json(user)
                    }
                    
                })
            }else{

            res.json({
                message:'username is not avilable'
            })   
            }
        }
    })
    
})

/*router.get('/',(req,res)=> {
    console.log('YEET')
})*/

router.post('/signin',(req,res)=>{
   User.findOne({ username:req.body.username,password:req.body.password}).then((err,user)=>{
    
    if (err) {
        console.log(err)
        res.json(err)
    }
    else{
        
        res.json(user)            
    }
   })
    
})

module.exports = router