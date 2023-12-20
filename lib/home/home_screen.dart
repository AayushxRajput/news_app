import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../GetSimpleApi.dart';

class HomeScreen extends StatefulWidget {
  // final List _posts = [
  //   'post 1',
  // ];

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static getApiData() {}

  // static void getApiData() {}
}

class _HomeScreenState extends State<HomeScreen> {

  late List<GetSimpleApi> apiList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    var arrNews = [

    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Breaking News',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Local Asset Image
                  Image.asset(
                    'images/modi_ji.jpg', // Replace with the actual path to your local image asset
                    width: 335,
                    fit: BoxFit.cover,
                  ),

                  // News Title
                  const Padding(
                    padding: EdgeInsets.all(9.5),
                    child: Text(
                      "Prime Minister Narendra Modi launches Viksit Bharat@2047: Voice of Youth",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),

                  // News Description
                  const Padding(
                    padding: EdgeInsets.all(9.5),
                    child: Text(
                      "Modi Ji, yaani ki Narendra Modi, Bharat ke vartaman Pradhan Mantri hain."
                          " Unhone Bharatiya Janata Party (BJP) ke pramukh netritva mein 2014 mein"
                          " Pradhan Mantri pad ki shapath li thi aur phir 2019 mein bhi dobara is"
                          " pad par chune gaye the. Modi Ji ne apne karyakal mein kai mahatva purna"
                          " kadam uthaye hain, aur unke netritva mein kuch mukhya initiatives hain: ",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            );
          },
          itemCount: arrNews.length,
        )
    );
  }
 Future<GetSimpleApi?> getApiData() async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=cd7cf0dec5214fe9be27870754ae2076";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
   var data =jsonDecode(response.body);
  return GetSimpleApi.fromJson(response.body as Map<String, dynamic>);

    }
    else{
      return null;
    }
  }
}
