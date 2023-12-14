import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List _posts = [
    'post 1',
  ];

      HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

var arrNews =['modi ji', 'akshat ji' , 'mayank ji','modi ji', 'akshat ji' , 'mayank ji','akshat ji' , 'mayank ji','akshat ji' , 'mayank ji',];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Breaking News',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),

      body: ListView.builder(
        itemBuilder: (context, index){
        return Text(arrNews[index],style: TextStyle( fontWeight: FontWeight.w700,fontSize: 24),);
      },
          itemCount: arrNews.length,
        itemExtent: 100,
      )
    );
  }
}
