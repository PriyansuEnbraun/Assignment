import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(iconTheme: IconThemeData(color: Colors.white)   ,title: Text("Home Screen",style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontSize: 20),),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home Screen',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 45,
                fontFamily: 'Poppins',
              ),
            )
          ],
        ),
      ),
    );
  }
}
