import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlankScreen(),
    );
  }
}

class BlankScreen extends StatefulWidget {
  const BlankScreen({super.key});

  @override
  State<BlankScreen> createState() => _BlankScreenState();
}

class _BlankScreenState extends State<BlankScreen> {


  // home page me 5 seconds bad me jane bala code
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  HomeScreen()));
    });
  }
  //home page me 5 seconds bad me jane bala code

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/splash_pic.jpg',
              fit: BoxFit.cover,
              width: width * 1.0,
              height: height * .5,
            ),
            const Text(
              'Top News MP',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20), // Add some spacing

            // Add SpinKit widget for loading spinner
            const SpinKitCircle(
              color: Colors.black,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
