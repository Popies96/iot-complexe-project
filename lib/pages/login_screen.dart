import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iot_project/pages/app_colors.dart';
import 'package:iot_project/pages/app_icons.dart';
import 'package:iot_project/pages/app_styles.dart';
import 'package:iot_project/pages/responsive_widget.dart';
import 'package:iot_project/pages/home_screen.dart';
import 'package:iot_project/user.dart';
import 'package:iot_project/pages/validator.dart';
import 'package:http/http.dart' as http;
import 'package:iot_project/pages/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  
   const LoginScreen({Key? key}) : super(key: key);
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  bool _showPassword = false;

  

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User user = User('','');
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedpref();
  }

  void initSharedpref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
  if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
    var regBody = {
      "username":usernameController.text,
      "password": passwordController.text
    };
    var response = await http.post(Uri.parse(signIn),
        headers : {"Content-Type" : "application/json"},
        body : jsonEncode(regBody)
    );
    var jsonResponse = jsonDecode(response.body);
    if(jsonResponse['status']) {
      var myToken = jsonResponse['token'];
      prefs.setString(('token'), myToken);
      Navigator.push(context , MaterialPageRoute(builder: (Context) =>NavigationRailPage(token : myToken)));
    }else {
      print('something went wrong');
    }
  }
  

}


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      height: height,
                      color: AppColors.mainBlueColor,
                      child: Center(
                        child: Text(
                          'Smart Link ',
                          style: ralewayStyle.copyWith(
                            fontSize: 48.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isSmallScreen(context)
                        ? height * 0.032
                        : height * 0.12),
                color: AppColors.backColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.2),
                      RichText(
                        text: TextSpan(
                          children: [
                            
                            TextSpan(

                              text: ' Log In ',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.blueDarkColor,
                                fontSize: 35.0,
                              ),
                            ),
                          ],
                        ),
                      ),


                      SizedBox(height: height * 0.02),
                      Text(
                        'Enter your details to Log in \nto your account.',
                        style: ralewayStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          
                          'Username',
                          style: ralewayStyle.copyWith(
                            fontSize: 15.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.025),
                              TextFormField(
                                controller: usernameController,
                                
                                  onChanged: (value){
                            user.username = value;
                          },
                         
                             validator: (value) {
                                  return Validator.validateName(value ?? "");
                                },
                                
                                decoration: InputDecoration(
                                  //errorText: _isNotValidate ? "enter Proper Info": null,
                                  errorBorder:  OutlineInputBorder(
                                    borderSide:const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(16),
                                     ),
                                     focusedErrorBorder:  OutlineInputBorder(
                                    borderSide:const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(16),
                                     ),
                                  
                                  prefixIcon: IconButton(
                                    padding: const EdgeInsets.only(left : 20, right : 20),
                              onPressed: (){},
                              hoverColor: AppColors.backColor,
                              splashColor: AppColors.backColor,
                              icon: Image.asset(AppIcons.emailIcon),),

                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Username",
                                  hintStyle: const TextStyle(
                                      color: Color(0xFFB9B9B9),
                                      fontFamily: "Jost",
                                      fontSize: 15.5),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      left: 30.0, bottom: 15, top: 15),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  //ERRRORRRR
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                      SizedBox(height: height * 0.05),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Password',
                          style: ralewayStyle.copyWith(
                            fontSize: 15.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.025),
                              TextFormField(
                                obscureText: !_showPassword,
                                controller: passwordController,
                                validator: (value) {
                                  return Validator.validatePassword(
                                      value ?? "");
                                },
                                
                                decoration: InputDecoration(
                                  errorBorder:  OutlineInputBorder(
                                    borderSide:const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(16),
                                     ),
                                     focusedErrorBorder:  OutlineInputBorder(
                                    borderSide:const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(16),
                                     ),
                                    prefixIcon: IconButton(
                                    padding: const EdgeInsets.only(left : 20, right : 20),
                                    hoverColor: AppColors.backColor,
                                    splashColor: AppColors.backColor,
                                    
                              onPressed: () {},
                              icon: Image.asset(AppIcons.lockIcon),
                            ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(
                                          () => _showPassword = !_showPassword);
                                    },
                                    child: Icon(
                                      _showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: "Password",
                                  fillColor: Colors.white,
                                  filled: true,

                                  hintStyle: const TextStyle(
                                      color: Color(0xFFB9B9B9),
                                      fontFamily: "Jost",
                                      fontSize: 15.5),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      left: 30.0, bottom: 15, top: 15),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  //ERRRORRRR
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),






                      ////////////////////////////////////////////
                      SizedBox(height: height * 0.03),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: AppColors.mainBlueColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: ElevatedButton(
                                      onPressed:(){
                                        loginUser();

                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.mainBlueColor,
                                        shape: const StadiumBorder(),
                                        minimumSize: const Size(200, 60),
                                        elevation: 0,
                                      ),
                                      child: Text(
                                       'Sign In',
                                       style: ralewayStyle.copyWith(
                                       fontWeight: FontWeight.w700,
                                       color: AppColors.whiteColor,
                                       fontSize: 16.0,
                                      ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
