import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  get nameEditTextcontroller => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Image.asset('core/Assets/images/ers.png',height: 60,width: 150,),
            SizedBox(height: 25),
            Text("Login to your account ",style: TextStyle(fontSize: 20,fontFamily: 'Poppins')),
            SizedBox(height:20),
          ],
        ),
      ),
    );
  }
}
