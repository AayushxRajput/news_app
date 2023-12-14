import 'package:flutter/material.dart';

class DataHome extends StatefulWidget {
  const DataHome({super.key});

  @override
  State<DataHome> createState() => _DataHomeState();
}

class _DataHomeState extends State<DataHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Local Asset Image
                  Image.asset(
                    'images/modi_ji.jpg', // Replace with the actual path to your local image asset
                    width:335,
                    fit: BoxFit.cover,
                  ),

                  // News Title
                  const Padding(
                    padding: EdgeInsets.all(9.5),
                    child: Text("Prime Minister Narendra Modi launches Viksit Bharat@2047: Voice of Youth",style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),),
                  )

                  // News Description

                ],
              ),
             ),
           ),
    );
  }
}
