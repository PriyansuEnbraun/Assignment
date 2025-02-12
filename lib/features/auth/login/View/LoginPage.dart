import 'package:assignment/features/auth/ForgotLoginId/View/ForgotLoginIdPage.dart';
import 'package:assignment/features/auth/ForgotPassword/View/ForgotPasswordPage.dart';
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

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();

  //valueNotifier
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier<bool>(true);

  final TextEditingController loginIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode loginFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  String? loginIdError;
  String? passwordError;

  void _validateFields() {
    setState(() {
      loginIdError = _validateLoginId(loginIdController.text);
      if (loginIdError != null) return;

      passwordError = _validatePassword(passwordController.text);
      if (passwordError != null) return;
    });
  }

  String? _validateLoginId(String value) {
    return value.isEmpty ? 'Login ID cannot be empty' : null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8 || value.length > 50) {
      return 'Password must be between 8 and 50 characters';
    } else if (!RegExp(
            r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,50}$')
        .hasMatch(value)) {
      return 'Password must contain letters, numbers, and special characters';
    }
    return null;
  }

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
    final isSmallPhoneScreen = screenWidth < 400 && screenHeight < 750;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(onTap: () {
          FocusScope.of(context).unfocus();
        }, child: LayoutBuilder(builder: (context, constraints) {
          final isSmallScreen =
              constraints.maxWidth < 400 || constraints.maxHeight < 650;
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        Image.asset(
                          'core/Assets/images/ers.png',
                          height: 60,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 25),
                        Text("Login to your account ",
                            style: TextStyle(
                                fontSize: isSmallPhoneScreen ? 15 : 20,
                                fontFamily: 'Poppins')),
                        SizedBox(height: 30),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            focusNode: loginFocusNode,
                            cursorColor: Colors.blue,
                            controller: loginIdController,
                            onFieldSubmitted: (value) {
                              _validateFields();
                              Utils.fieldFocusChange(
                                  context, loginFocusNode, passwordFocusNode);
                            },
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: isSmallPhoneScreen ? 15 : 20,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.red,
                                fontSize: isSmallPhoneScreen?8:10,
                                fontFamily: 'Poppins',
                              ),
                              errorText: loginIdError,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red, width: 2),
                              ),
                              hintText: "Login ID",
                              prefixIcon: Image.asset(
                                  'core/Assets/images/profile.png',
                                  width: 10,
                                  height: 10,
                                  color: Colors.black),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: isSmallPhoneScreen ? 15 : 18,
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
                            onChanged: (value) => setState(() => loginIdError = _validateLoginId(value)),
                          ),
                        ),
                        SizedBox(height: 20),
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
                                      fontSize: isSmallPhoneScreen ? 15 : 20,
                                      fontFamily: 'Poppins',
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontSize: isSmallPhoneScreen?8:10,
                                      fontFamily: 'Poppins',
                                    ),
                                    errorText: passwordError,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red, width: 2),
                                    ),
                                    hintText: "Password",
                                    prefixIcon: Image.asset(
                                      'core/Assets/images/key.png',
                                      width: 10,
                                      height: 10,
                                      color: Colors.black87,
                                    ),
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
                                        fontSize: isSmallPhoneScreen ? 15 : 18,
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
                                      borderRadius: BorderRadius.circular(
                                          8), // Rounded corners
                                    ),
                                  ),
                                  onChanged: (value) => setState(() => passwordError = _validatePassword(value)),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 55,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.all(isSmallPhoneScreen ? 10 : 15)),
                            onPressed: () async {
                              _validateFields();
                              if (loginIdError == null && passwordError == null){
                                bool? doesExist = await LoginViewModel()
                                    .checkUserExists(loginIdController.text,
                                        passwordController.text);
                                if (doesExist == true) {
                                  Utils.showSnackBar(context,
                                      "Login Successfully", Colors.green);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                } else {
                                  Utils.showSnackBar(
                                      context,
                                      "Invalid User - Try to Signup First !",
                                      Colors.blue);
                                }
                              }
                            },
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  // Text color
                                  fontSize: isSmallPhoneScreen ? 15 : 20,
                                  // Font size]
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
                              color: Colors.grey,
                              fontSize: isSmallPhoneScreen ? 15 : 15,
                              fontFamily: 'Poppins'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 20,right: 20),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signuppage()));
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(isSmallPhoneScreen?10:15),
                                  backgroundColor: Colors.white,
                                  side:
                                      BorderSide(color: Colors.blue, width: 2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: isSmallPhoneScreen ? 15 : 20,
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Forgotloginidpage()));
                                  Utils.showSnackBar(context,
                                      "Forgot Login Id Pressed!!", Colors.blue);
                                },
                                child: Text(
                                  'Forgot Login Id?',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: isSmallPhoneScreen ? 12 : 15,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Forgotpasswordpage()));
                                  Utils.showSnackBar(context,
                                      "Forgot Password Pressed!!", Colors.blue);
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: isSmallPhoneScreen ? 12 : 15,
                                      fontFamily: 'Poppins'),
                                ),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Enbraun Technologies Private Limited',
                                style: TextStyle(
                                    fontSize: isSmallPhoneScreen?10:12,
                                    fontFamily: 'Poppins',
                                    color: Colors.grey),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.copyright_outlined,
                                color: Colors.grey,
                                size: isSmallPhoneScreen?12:15,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '2025',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: isSmallPhoneScreen?10:12,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        })),
      ),
    );
  }
}
