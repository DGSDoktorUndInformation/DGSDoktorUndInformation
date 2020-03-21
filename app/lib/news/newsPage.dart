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

  Future<List<News>> _getNewsData() async {
    // rest.post(rest.getURL(), "body");

    var test = new List<News>();

    var testNews = new News();
    testNews.title = "Bleibt zuhause";
    testNews.thumbnail = Image.network("https://www.roller.de/medias/sys_master/root/h2d/haf/9456392732702/3-sitzer-sofa-dunkelbraun-relaxfunktion-101508770.jpg");
    testNews.url       = "https://www.roller.de/einzelsofas-2er-3er-4er/3-sitzer-sofa-dunkelbraun-relaxfunktion/1015087700/";

    test.add(testNews);

    testNews = new News();
    testNews.title = "Corona im Alltag";
    testNews.thumbnail = Image.network("https://www.hessenschau.de/panorama/alltag-104~_t-1584640814199_v-16to9__medium.jpg");
    testNews.url       = "https://www.hessenschau.de/panorama/coronavirus--harsche-kritik-an-spahn-plaenen--zweiter-eintracht-spieler-positiv--1166-infizierte-in-hessen--,corona-hessen-ticker-100.html";

    test.add(testNews);

    testNews = new News();
    testNews.title = "Zeichnen in Slack macht Spaß";
    testNews.thumbnail = Image.network("https://apps-cloud.n-tv.de/img/20987819-1556271889000/16-9/750/26356881.jpg");
    testNews.url       = "https://www.hessenschau.de/panorama/coronavirus--harsche-kritik-an-spahn-plaenen--zweiter-eintracht-spieler-positiv--1166-infizierte-in-hessen--,corona-hessen-ticker-100.html";

    test.add(testNews);





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