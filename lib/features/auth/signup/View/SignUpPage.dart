import 'package:assignment/Utils/utils.dart';
import 'package:assignment/features/homescreen/View/HomePage.dart';
import 'package:flutter/material.dart';

import '../ViewModel/SignUpViewModel.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  //valueNotifier
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _isConfirmPasswordVisible =
      ValueNotifier<bool>(true);

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController createLoginIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode fullName = FocusNode();
  final FocusNode createLoginID = FocusNode();
  final FocusNode password = FocusNode();
  final FocusNode confirmPassword = FocusNode();

  @override
  void dispose() {
    fullName.dispose();
    createLoginID.dispose();
    password.dispose();
    confirmPassword.dispose();
    fullNameController.dispose();
    createLoginIdController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Determine if it's a small or large screen
    final isSmallScreen = screenWidth < 400 && screenHeight < 650;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: isSmallScreen ? 50 : 100),
                  Image.asset(
                    'core/Assets/images/ers.png',
                    height: 60,
                    width: 150,
                  ),
                  SizedBox(height: 25),
                  Text("You're Almost There ! ",
                      style: TextStyle(
                          fontSize: isSmallScreen ? 15 : 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400)),
                  SizedBox(height: 25),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      focusNode: fullName,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.blue,
                      controller: fullNameController,
                      maxLines: 1,
                      onSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context, fullName, createLoginID);
                      },
                      style: TextStyle(
                          fontSize: isSmallScreen ? 15 : 20,
                          fontFamily: 'Poppins',
                          color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: isSmallScreen ? 15 : 18,
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
                        hoverColor: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      focusNode: createLoginID,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.blue,
                      controller: createLoginIdController,
                      maxLines: 1,
                      onSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context, createLoginID, password);
                      },
                      style: TextStyle(
                          fontSize: isSmallScreen ? 15 : 20,
                          fontFamily: 'Poppins',
                          color: Colors.black),
                      decoration: InputDecoration(
                          hintText: "Create Login Id",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: isSmallScreen ? 15 : 18,
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
                          hoverColor: Colors.lightBlueAccent),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: ValueListenableBuilder<bool>(
                        valueListenable: _isPasswordVisible,
                        builder: (context, value, child) {
                          return TextField(
                            focusNode: password,
                            obscureText: _isPasswordVisible.value,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.blue,
                            controller: passwordController,
                            maxLines: 1,
                            onSubmitted: (value) {
                              Utils.fieldFocusChange(
                                  context, password, confirmPassword);
                            },
                            style: TextStyle(
                                fontSize: isSmallScreen ? 15 : 20,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: InkWell(
                                onTap: () {
                                  _isPasswordVisible.value =
                                      !_isPasswordVisible.value;
                                },
                                child: Icon(
                                  _isPasswordVisible.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                ),
                              ),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: isSmallScreen ? 15 : 18,
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
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Length 8-50 with numbers,letters and special characters',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 8 : 10,
                            fontFamily: 'Poppins',
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: ValueListenableBuilder(
                        valueListenable: _isConfirmPasswordVisible,
                        builder: (context, value, child) {
                          return TextField(
                            focusNode: confirmPassword,
                            obscureText: _isConfirmPasswordVisible.value,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.blue,
                            controller: confirmPasswordController,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: isSmallScreen ? 15 : 20,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Confirm password ",
                              suffixIcon: InkWell(
                                onTap: () {
                                  _isConfirmPasswordVisible.value =
                                      !_isConfirmPasswordVisible.value;
                                },
                                child: Icon(
                                  _isConfirmPasswordVisible.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                ),
                              ),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: isSmallScreen ? 15 : 18,
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
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'By signing up you agree to our',
                          style: TextStyle(
                              fontSize: isSmallScreen ? 8 : 10,
                              color: Colors.black54,
                              fontFamily: 'Poppins'),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            Utils.showSnackBar(context,
                                "Terms of Service Pressed!!", Colors.blue);
                          },
                          child: Text('Terms of Service',
                              style: TextStyle(
                                  fontSize: isSmallScreen ? 8 : 10,
                                  color: Colors.blue,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text('and',
                            style: TextStyle(
                                fontSize: isSmallScreen ? 8 : 10,
                                color: Colors.black54,
                                fontFamily: 'Poppins')),
                        SizedBox(
                          width: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            Utils.showSnackBar(context,
                                "Privacy Policy Pressed!!", Colors.blue);
                          },
                          child: ClipRect(
                            child: Text('Privacy Policy.',
                                style: TextStyle(
                                    fontSize: isSmallScreen ? 8 : 10,
                                    color: Colors.blue,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 8,
                            padding: EdgeInsets.all(10),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onPressed: () async {
                          String? error = SignUpViewModel().validateSignUp(
                              fullNameController.text,
                              createLoginIdController.text,
                              passwordController.text,
                              confirmPasswordController.text);
                          if (error != null) {
                            Utils.showSnackBar(context, error, Colors.red);
                          } else {
                            String? result = await SignUpViewModel().addUser(
                                fullNameController.text,
                                createLoginIdController.text,
                                passwordController.text);

                            if (result == 'User added successfully.') {
                              Utils.showSnackBar(
                                  context, result as String, Colors.green);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            } else if (result as String ==
                                'Login ID is taken. Please create a new one.') {
                              Utils.showSnackBar(context, result, Colors.red);
                            } else {
                              Utils.showSnackBar(context, result, Colors.red);
                            }
                          }
                        },
                        child: Text(
                          "Let's Start",
                          style: TextStyle(
                              fontSize: isSmallScreen ? 15 : 20,
                              fontFamily: 'Poppins',
                              color: Colors.white),
                        )),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: isSmallScreen ? 12 : 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isSmallScreen ? 60 : 120),
                  Row(
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
