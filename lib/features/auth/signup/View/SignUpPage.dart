import 'package:assignment/features/auth/login/View/LoginPage.dart';
import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController createLoginIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verificationCodeController =
      TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                Image.asset(
                  'core/Assets/images/ers.png',
                  height: 60,
                  width: 150,
                ),
                SizedBox(height: 25),
                Text("You're Almost There ! ",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400)),
                SizedBox(height: 25),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    focusNode: _focusNode1,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.blue,
                    controller: fullNameController,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
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
                    focusNode: _focusNode2,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.blue,
                    controller: createLoginIdController,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Create Login Id",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
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
                  child: TextField(
                    focusNode: _focusNode3,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.blue,
                    controller: passwordController,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
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
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Length 8-50 with numbers,letters and special characters',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    focusNode: _focusNode4,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.blue,
                    controller: verificationCodeController,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Enter verification code sent to your email ",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
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
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'By signing up you agree to our',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text('Terms of Service',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.blue,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 2,
                    ),
                    Text('and',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
                            fontFamily: 'Poppins')),
                    SizedBox(
                      width: 2,
                    ),
                    Text('Privacy Policy.',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.blue,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold)),
                  ],
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
                      onPressed: () {
                        print("Let's Start Pressed");
                      },
                      child: Text(
                        "Let's Start",
                        style: TextStyle(
                            fontSize: 20,
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
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Loginpage()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 150),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Enbraun Technologies Private Limited',style: TextStyle(fontSize: 12,fontFamily: 'Poppins',color: Colors.grey),),
                    SizedBox(width: 5,),
                    Icon(Icons.copyright_outlined,color: Colors.grey,),
                    SizedBox(width: 5),
                    Text('2025',style: TextStyle(fontFamily: 'Poppins',fontSize: 12,color: Colors.grey),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
