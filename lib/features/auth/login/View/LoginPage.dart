import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  get loginIdController => null;

  get passwordController => null;

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset(
              'core/Assets/images/ers.png',
              height: 60,
              width: 150,
            ),
            SizedBox(height: 25),
            Text("Login to your account ",
                style: TextStyle(fontSize: 20, fontFamily: 'Poppins')),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                cursorColor: Colors.blue,
                controller: loginIdController,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Poppins', color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Login ID",
                  prefixIcon: Icon(Icons.person_2_outlined),
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: 18, fontFamily: 'Poppins'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      // Border color when TextField is focused
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(2), // Rounded corners
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
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
                      color: Colors.grey, fontSize: 18, fontFamily: 'Poppins'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      // Border color when TextField is focused
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(2), // Rounded corners
                  ),
                ),
              ),
            ),
            Row(
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
                  width: 3,
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
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              // Add padding around the button
              child: SizedBox(
                width: double.infinity, // Make the button fill the screen width
                child: TextButton(
                  onPressed: () {
                    print("Button pressed");
                  },
                  style: TextButton.styleFrom(
                    elevation: 15,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Colors.blue, // Button background color
                    padding: EdgeInsets.symmetric(
                        vertical: 16.0), // Vertical padding
                  ),
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
            SizedBox(height: 5),
            Row(
              children: [

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Row(children: [
                    TextButton(
                        onPressed: () {
                          print('Button Pressed');
                        },
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            shape: BeveledRectangleBorder(
                                side: BorderSide(
                                    color: Colors.blue, width: 0.5),
                                borderRadius: BorderRadius.circular(5))),
                        child: Text(
                          'Single Sign On',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              color: Colors.blue),
                        )),
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            backgroundColor: Colors.white,
                            shape: BeveledRectangleBorder(
                                side: BorderSide(
                                    color: Colors.blue, width: 0.5),
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {
                          print('Button Pressed');
                        },
                        child: Text(
                          'Request Trial',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Colors.blue),
                        )),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
