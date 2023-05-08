const UserModel = require ('../models/user.model')
const jwt = require('jsonwebtoken');
class UserService{
/*
  static async loginUser(username,password){
     try {
        return await UserModel.findOne({username});
     }catch(error){
        throw error;
     }
  }*/
  static async checkuser(username){
    try {
        return await UserModel.findOne({username});
    } catch (error){
          throw error;
    }
  }

  static async generateToken(tokenData,secreteKey,jwt_expire) {
    return jwt.sign(tokenData,secreteKey,{expiresIn:jwt_expire}) ;
  }

}

/*
exports.checkUser = async (username) => {
  try {
    const user = await User.findOne({ username: username });
    return user;
  } catch (error) {
    throw error;
  }
};
*/

module.exports = UserService;