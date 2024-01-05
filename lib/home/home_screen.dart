import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../NewsListModel.dart';
import '../widget/news_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsListModel newsListModel = NewsListModel();

  Future<NewsListModel> getApiData() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=cd7cf0dec5214fe9be27870754ae2076";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return NewsListModel.fromJson(data);
      } else {
        // Error case ko handle karein, aap yahaan exception throw kar sakte hain ya phir error ko log bhi kar sakte hain.
        print(
            "Data fetch karne mein kuch gadbad. Status code: ${response.statusCode}");
        return NewsListModel(); // Aap yahaan null bhi return kar sakte hain ya phir exception throw bhi kar sakte hain.
      }
    } catch (error) {
      // API call ya JSON parsing ke dauran aane wale exceptions ko handle karein.
      print("API call mein error: $error");
      return NewsListModel(); // Aap yahaan null bhi return kar sakte hain ya phir exception throw bhi kar sakte hain.
    }
  }

  Future<void> setData() async {
    newsListModel = await getApiData();

    print(newsListModel.articles?[0].title ??
        "Ye hai default value agar value null hai to");
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  /*

  [
    0: "Article",
    1: "Article",
    2: "Article",
    3: "Article",
    4: "Article",
    5: "Article"
  ]

   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Breaking News',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        body:
            PageView.builder(
              scrollDirection: Axis.vertical,  // ye page ko horizontal & vertical kar sak te he
                itemCount: 10, itemBuilder:
                (context, index) {
                 return NewsContainer(
                     imgUrl: "https://media.istockphoto.com/id/1859663342/photo/tree-in-green-wheat-field.webp?s=2048x2048&w=is&k=20&c=Ls6Ljgz-nPF35IeKN0x7957INDKYIpxnS948bQlBdBU=",
                     newsTitle: "5G in India",
                     newsDescription: "India's 5G user base has more than tripled from last "
                         "year—and is expected to by 2029, according to the Ericsson Mobility "
                         "Report 2023 published Thursday. Last year, Ericsson pegged India's 5G"
                         " subscriber base at 31 million users, rising by over 4x in 2023 itself",
                     newsUrl: "https://www.indiatoday.in/technology/news/story/redmi-note-13-5g-india-price-complete-specifications-have-leaked-just-days-ahead-of-its-launch-2482776-2024-01-01"
                 );
                }
           )
    );
  }
}
