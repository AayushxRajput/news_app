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
  NewsListModel? newsListModel;

  Future<NewsListModel> getApiData() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=cd7cf0dec5214fe9be27870754ae2076";

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
    }

    catch (error) {
      // API call ya JSON parsing ke dauran aane wale exceptions ko handle karein.

      print("API call mein error: $error");
      return NewsListModel(); // Aap yahaan null bhi return kar sakte hain ya phir exception throw bhi kar sakte hain.
    }
  }

  Future<void> setData() async {

    await getApiData().then((value) {
      setState(() {
        newsListModel = value;
          }
        );
      }
    );

    print(newsListModel?.articles?[0].title ?? "Ye hai default value agar value null hai to");
  }

  @override
  void initState() {
    setData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: const Text(
            'Breaking News',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),

        body: newsListModel?.articles?.length == 0 ? const Center(child: CircularProgressIndicator())
            : PageView.builder(
              scrollDirection: Axis.vertical,  // ye page ko horizontal & vertical kar sak te he
                itemCount: newsListModel?.articles?.length ?? 0, itemBuilder: (context, index) {


                 return NewsContainer(
                     imgUrl: newsListModel?.articles?[index].urlToImage.toString() ?? "",
                     newsTitle: newsListModel?.articles?[index].title.toString() ?? "",
                     newsDescription: newsListModel?.articles?[index].description.toString() ?? "",
                     newsUrl: newsListModel?.articles?[index].url.toString() ?? "",
                 );
                }
           )
     );
  }
}
