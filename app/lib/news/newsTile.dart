import 'package:dsgdoctor/news/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

newsTile(News news, BuildContext context) {
  TextStyle textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextStyle subTitle = TextStyle(fontFamily: 'Montserrat', fontSize: 14.0, color: Colors.grey);

  Icon linkType;
  String dateString;

  if (news.isVideo) {
    linkType = Icon(Icons.ondemand_video);
  } else {
    linkType = Icon(Icons.edit);
  }

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day).difference(DateTime(now.year, now.month, now.day)).inDays;
  }

  if(calculateDifference(news.timestamp) == 0){
    dateString = "Heute "  + DateFormat('hh:mm').format(news.timestamp);
  }
  else{
    dateString = DateFormat('dd.MM.yyyy hh:mm').format(news.timestamp);
  }

  return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: GestureDetector(
          onTap: () async {
            await launch(news.url);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      news.title,
                      style: textStyle,
                    ),
                    linkType
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(children: <Widget>[Text(
                  dateString,
                  style: subTitle,
                  textAlign: TextAlign.left,
                ),],),

                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 125, child: news.thumbnail)
              ],
            ),
          )));
}
