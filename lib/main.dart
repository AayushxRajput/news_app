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
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }
  //home page me 5 seconds bad me jane bala code

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(

      // backgroundColor: Colors.blue,
      // appBar: AppBar(
      //   backgroundColor: Colors.cyanAccent,
      //   leading: IconButton(
      //     icon: Image.asset('images/insta_logo.png'), onPressed: () {  },
      //   ),
      //     title: Text('aayush_rajput__47',style: TextStyle(fontSize: 20),),
      // ) ,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Card(
                  elevation: 10,
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Image.asset(
                    'images/splash_pic.jpg',
                    fit: BoxFit.cover,
                    width: width * 1.0,
                    height: height * .5,
                  ),
                ),

                Text(
                  'Top News',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 20), // Add some spacing

                // Add SpinKit widget for loading spinner
                SpinKitCircle(
                  color: Colors.black,
                  size: 50.0,
                ),

              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                icon: Icon(Icons.arrow_forward),
                label: Text("NEXT"),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
