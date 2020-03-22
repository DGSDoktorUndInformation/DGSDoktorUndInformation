import 'package:dsgdoctor/news/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


newsTile(News news, BuildContext context) {
  TextStyle textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: GestureDetector(
          onTap: () async {
            await launch(news.url);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Text(
                  news.title,
                  style: textStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(height: 200, child: news.thumbnail)
              ],
            ),
          )));
}
