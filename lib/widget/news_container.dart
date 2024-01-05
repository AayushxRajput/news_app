import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {

  String imgUrl;
  String newsTitle;
  String newsDescription;
  String  newsUrl;


   NewsContainer({super.key,
     required this.imgUrl,
     required this.newsTitle,
     required this.newsDescription,
     required this.newsUrl,
   });

  @override
  Widget build(BuildContext context) {
    return Container(

      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Card(
            elevation:10,
            margin: EdgeInsets.fromLTRB(10, 0.0, 10, 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            child: Image.network(
                height :400,
                width: MediaQuery.of(context).size.width,
                fit:BoxFit.cover,imgUrl),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10,),
                Text(newsTitle,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

                SizedBox(height: 10,),
                Text(newsDescription,

                  style: TextStyle( fontSize: 17),),

              ],
            ),
          ),

          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: (){
                print("Going to $newsUrl");
              },
                  child:  Text("Read More")

              ),
            ],
          )
        ],
      ),
    );
  }
}
