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

  var test = new List<News>();

  generateNews(String title,
               Image thumbnail,
               String url,
               DateTime timestamp,
               bool isVideo){

    var testNews = new News();
    testNews.title =title;
    testNews.thumbnail = thumbnail;
    testNews.url       = url;
    testNews.isVideo   = isVideo;
    testNews.timestamp = timestamp;

    test.add(testNews);


  }

  Future<List<News>> _getNewsData() async {
    // rest.post(rest.getURL(), "body");

    generateNews("Bleibt zuhause",
                 Image.network("https://www.roller.de/medias/sys_master/root/h2d/haf/9456392732702/3-sitzer-sofa-dunkelbraun-relaxfunktion-101508770.jpg"),
                 "https://www.roller.de/einzelsofas-2er-3er-4er/3-sitzer-sofa-dunkelbraun-relaxfunktion/1015087700/",
    DateTime.now(),
    false);

    generateNews("Corona im Alltag",
        Image.network("https://www.hessenschau.de/panorama/alltag-104~_t-1584640814199_v-16to9__medium.jpg"),
        "https://www.roller.de/einzelsofas-2er-3er-4er/3-sitzer-sofa-dunkelbraun-relaxfunktion/1015087700/",
        DateTime.now(),
        true);

    generateNews("Zeichnen in Slack macht Spaß",
        Image.network("https://apps-cloud.n-tv.de/img/20987819-1556271889000/16-9/750/26356881.jpg"),
        "https://www.roller.de/einzelsofas-2er-3er-4er/3-sitzer-sofa-dunkelbraun-relaxfunktion/1015087700/",
        DateTime.now(),
        false);








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
            else
            if(snapshot.data != null && snapshot.data.length != 0){
              return createListView(context, snapshot);
            }
            else{
              return new Text('KEINE NEWS!');
            }
        }
      },
    );

    return Scaffold(
        backgroundColor: ThemeColors.Primary,
        appBar: AppBar(
          backgroundColor: ThemeColors.Primary,
          actions: <Widget>[
          ],


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
            tooltip: 'Zurück')),body
    :
    SingleChildScrollView
    (
       child: Container(
         height: MediaQuery.of(context).size.height ,
         child: futureBuilder,
       )
    ));
  }
}