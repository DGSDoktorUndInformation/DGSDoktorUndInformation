import 'package:DGSDocInfo/appBarContent.dart';
import 'package:DGSDocInfo/colors.dart';
import 'package:DGSDocInfo/news/news.dart';
import 'package:DGSDocInfo/news/newsApi.dart';
import 'package:DGSDocInfo/news/newsTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  NewsPage();

  @override
  State<StatefulWidget> createState() {
    return NewsPageState();
  }
}

class NewsPageState extends State<NewsPage> {
  var test;

  generateNews(String title, Image thumbnail, String url, DateTime timestamp,
      bool isVideo, bool isEmbeddedVideo) {
    var testNews = new News();
    testNews.title = title;
    testNews.thumbnail = thumbnail;
    testNews.url = url;
    testNews.isVideo = isVideo;
    testNews.timestamp = timestamp;
    testNews.isEmbeddedVideo = isEmbeddedVideo;

    test.add(testNews);
  }

  Future<List<News>> _getNewsData() async {
    test = await NewsApi().getNews(1);

    return test;
  }

  @override
  Widget build(BuildContext context) {
    Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
      print("CREATE LIST VIEW");
      List<News> values = snapshot.data;
      print("HALLO");

      var length;

      if (values == null) {
        length = 0;
      } else {
        length = values.length;
      }

      return new ListView.builder(
        itemCount: length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              newsTile(values[index], context),
              new Divider(
                height: 15.0,
              ),
            ],
          );
        },
      );
    }

    var futureBuilder = new FutureBuilder(
      future: _getNewsData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else if (snapshot.data != null && snapshot.data.length != 0) {
              return createListView(context, snapshot);
            } else {
              return new Text('KEINE NEWS!');
            }
        }
      },
    );

    return Scaffold(
        backgroundColor: ThemeColors.Primary,
        appBar: AppBar(
            backgroundColor: ThemeColors.Primary,
            actions: <Widget>[],

            //onPressed: () async => onSave(context),

            centerTitle: true,
            automaticallyImplyLeading: false,
            title: AppBarContent(),
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: ThemeColors.Icon,
                ),
                tooltip: 'Zurück')),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height - 80,
          child: futureBuilder,
        )));
  }
}
