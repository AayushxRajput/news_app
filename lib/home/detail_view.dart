import 'package:flutter/material.dart';

class DetailViewScreen extends StatefulWidget {
  String imgUrl;
  String newsTitle;
  String newsDescription;
  String newsUrl;

  DetailViewScreen(
      {super.key,
      required this.newsUrl,
      required this.imgUrl,
      required this.newsTitle,
      required this.newsDescription});

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('News',style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Text(' Detail',style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,)
            )
          ],
        ),

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            children: [
              Card(
                elevation: 10,
                margin: const EdgeInsets.fromLTRB(10, 0.0, 10, 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    widget.imgUrl),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.newsTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.newsDescription,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
