import 'package:flutter/material.dart';

class NewsContainer extends StatefulWidget {

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
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {


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
                height: 400,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                widget.imgUrl
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10,),
                Text(widget.newsTitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

                SizedBox(height: 10,),
                Text(widget.newsDescription,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle( fontSize: 17),),

              ],
            ),
          ),

          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              ElevatedButton(
                  onPressed: (){
                    print("Going to ${widget.newsUrl}");
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
