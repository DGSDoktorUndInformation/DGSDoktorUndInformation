import 'package:dsgdoctor/appBarContent.dart';
import 'package:dsgdoctor/colors.dart';
import 'package:dsgdoctor/news/news.dart';
import 'package:dsgdoctor/news/newsTile.dart';
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
    // rest.post(rest.getURL(), "body");

    test = new List<News>();

    generateNews(
        "WDR COSMO Corono-News",
        Image.network(
            "https://www1.wdr.de/funkhaus-europa-wird-cosmo-106~_v-TeaserAufmacher.jpg"),
        "https://www1.wdr.de/mediathek/video/radio/cosmo/video-corona-news-in-gebaerdensprache---104.html",
        DateTime.now(),
        true,
        false);

    generateNews(
        "Informationen in leichter Sprache",
        Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/BMG_Logo.svg/2000px-BMG_Logo.svg.png"),
        "https://www.bundesgesundheitsministerium.de/coronavirus/coronavirus-leichte-sprache.html?fbclid=iwar2n1ied0umao8zlzxa0bhgutr07x3n691ysidrutzq4jtgjhsbt9go9pce",
        new DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
        false,
        false);

    generateNews(
        "Pressemitteilung Badenwürtenberg",
        Image.network(
            "https://i.vimeocdn.com/video/866311781.webp?mw=1000&mh=563&q=70"),
        "https://player.vimeo.com/video/398592777",
        new DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 5),
        true,
        false);

    generateNews(
        "Pressemitteilung Badenwürtenberg",
        Image.network(
            "https://ksl-msi-nrw.de/public/styles/large/public/ksl/msi/bilder/Vorschau_Corona_Video.jpg?h=02882563&itok=5MAtx90k"),
        "https://ksl-msi-nrw.de/public/ksl/msi/video/ksl_corona_virus_MAGS_UT.mp4",
        new DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 5),
        true,
        true);

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
