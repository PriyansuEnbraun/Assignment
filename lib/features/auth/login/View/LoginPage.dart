import 'package:assignment/features/auth/signup/View/SignUpPage.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController loginIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  bool _isChecked = false;

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: (){
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
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins')),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  keyboardType:TextInputType.visiblePassword,
                  focusNode: _focusNode1,
                  cursorColor: Colors.blue,
                  controller: loginIdController,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20, fontFamily: 'Poppins', color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Login ID",
                    prefixIcon: Icon(Icons.person_2_outlined),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
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
                margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  keyboardType:TextInputType.visiblePassword,
                  focusNode: _focusNode2,
                  cursorColor: Colors.blue,
                  obscureText: true,
                  controller: passwordController,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20, fontFamily: 'Poppins', color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.key_outlined),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      activeColor: Colors.blue,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                    SizedBox(
                      width: 0,
                    ),
                    Text(
                      'Stay Signed In',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
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
                margin: EdgeInsets.only(left: 20,right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.all(10)
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Signuppage()));
                  },
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 20, // Font size]
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
                    color: Colors.grey, fontSize: 15, fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: TextButton(
                    onPressed: () {
                      print('Single Sign On Button Pressed');
                    },
                    style: TextButton.styleFrom(
                      side: BorderSide(color: Colors.blue,width: 2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    child: Center(
                      child: Text(
                        'Single Sign On',
                        style: TextStyle(
                            fontSize: 20,
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
                    Text(
                      'Forgot Login Id?',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ),
              SizedBox(height:150),
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
    );
  }
}
