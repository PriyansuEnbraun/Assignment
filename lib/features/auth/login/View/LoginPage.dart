import 'package:assignment/features/auth/login/ViewModel/LoginViewModel.dart';
import 'package:assignment/features/auth/signup/View/SignUpPage.dart';
import 'package:assignment/features/homescreen/View/HomePage.dart';
import 'package:flutter/material.dart';

import '../../../../Utils/utils.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class LoginCredentials {}

class _LoginpageState extends State<Loginpage> {

  //valueNotifier
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier<bool>(true);

  final TextEditingController loginIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode loginFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool _isChecked = false;

  @override
  void dispose() {
    loginFocusNode.dispose();
    passwordFocusNode.dispose();
    loginIdController.dispose();
    passwordController.dispose();
    _isPasswordVisible.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Fetch screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Determine if it's a small or large screen
    final isSmallScreen = screenWidth<400 && screenHeight<750;

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 100),
              Image.asset(
                'core/Assets/images/ers.png',
                height: 60,
                width: 150,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 25),
              Text("Login to your account ",
                  style: TextStyle(fontSize:isSmallScreen?15:20, fontFamily: 'Poppins')),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: loginFocusNode,
                  cursorColor: Colors.blue,
                  controller: loginIdController,
                  onSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context, loginFocusNode, passwordFocusNode);
                  },
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: isSmallScreen?15:20, fontFamily: 'Poppins', color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Login ID",
                    prefixIcon: Image.asset('core/Assets/images/profile.png',width:10,height:10,color: Colors.black),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: isSmallScreen?15:18,
                        fontFamily: 'Poppins'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        // Border color when TextField is focused
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ValueListenableBuilder<bool>(
                    valueListenable: _isPasswordVisible,
                    builder: (context, value, child) {
                      return TextField(
                        keyboardType: TextInputType.visiblePassword,
                        focusNode: passwordFocusNode,
                        cursorColor: Colors.blue,
                        obscureText: _isPasswordVisible.value,
                        controller: passwordController,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: isSmallScreen?15:20,
                            fontFamily: 'Poppins',
                            color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Image.asset('core/Assets/images/key.png',width:10,height:10,color: Colors.black87,),
                          suffixIcon: InkWell(
                            onTap: () {
                              _isPasswordVisible.value =
                                  !_isPasswordVisible.value;
                            },
                            child: Icon(_isPasswordVisible.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: isSmallScreen?15:18,
                              fontFamily: 'Poppins'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              // Border color when TextField is focused
                              width: 2.0,
                            ),
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      shape: RoundedRectangleBorder(side: BorderSide(width: 1), borderRadius: BorderRadius.circular(2)),
                      activeColor: Colors.blue,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                    Text(
                      'Stay signed in',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: isSmallScreen?15:17,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.all(10)),
                  onPressed: () {
                    String? error = LoginViewModel().validateLogin(
                        loginIdController.text, passwordController.text);
                    if (error != null) {
                      Utils.showSnackBar(context, error,Colors.red);
                    } else {
                      bool? isLoggedIn = LoginViewModel().checkInUserData(
                          loginIdController.text, passwordController.text);
                      if (isLoggedIn == true) {
                        Utils.showSnackBar(context, "Login Successfully",Colors.green);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      } else {
                        Utils.showSnackBar(
                            context, "Invalid User - Try to Signup First !",Colors.blue);
                      }
                    }
                  },
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: isSmallScreen?15:20, // Font size]
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins', // Custom font
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Or',
                style: TextStyle(
                    color: Colors.grey, fontSize: isSmallScreen?15:15, fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Signuppage()));
                    },
                    style: TextButton.styleFrom(
                        side: BorderSide(color: Colors.blue, width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: isSmallScreen?15:20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.blue),
                      ),
                    )),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Utils.showSnackBar(
                            context, "Forgot Login Id Pressed!!",Colors.blue);
                      },
                      child: Text(
                        'Forgot Login Id?',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: isSmallScreen?12:15,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Utils.showSnackBar(
                            context, "Forgot Password Pressed!!",Colors.blue);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: isSmallScreen?12:15,
                            fontFamily: 'Poppins'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: isSmallScreen?60:120),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enbraun Technologies Private Limited',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.grey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.copyright_outlined,
                      color: Colors.grey,
                      size: 15,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '2025',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
