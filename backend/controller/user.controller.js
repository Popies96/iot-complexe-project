const UserService = require('../services/user.services');

module.exports.login = async ( req , res , next ) => {
    try {
        const { username,password } = req.body;

        const user =  await UserService.checkuser(username);
        if (!username || !password) {
            throw new Error('Parameter are not correct');
        }
        if (!user) {
            throw new Error('User does not exist');
        }
        console.log(user)

        const isMatch = await user.comparePassword(password);

        if(isMatch === false) {
            throw  new Error('Invalid Password');
        }
        
        let tokenData = {_id:user._id,username:user.username};
            
        const token = await UserService.generateToken(tokenData,"secreteKey",'1h');

        res.status(200).json({status:true,token:token});
    } catch(error) {
        next(error);
    }
} 






  
/*exports.login = async (req, res, next) => { 
    
    try {
        const { username, password } = req.body;
        if (!username || !password) {
            throw new Error('Parameter are not correct');
        }
        console.log(username);
        let user = await UserService.checkUser(username);
        if (!user) {
            throw new Error('User does not exist');
        }
        
        const isPasswordCorrect = await user.comparePassword(password);
        if (isPasswordCorrect === false) {
            throw new Error(`Username or Password does not match`);
        }
        // Creating Token
        let tokenData;
        tokenData = { _id: user._id, username: user.username };
    
        const token = await UserService.generateAccessToken(tokenData,"secret","1h")
        res.status(200).json({ status: true, success: "sendData", token: token });
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }}*/