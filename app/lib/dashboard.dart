import 'dart:convert';

import 'package:dsgdoctor/corvidselbsttest/corvidselbsttest.dart';
import 'package:dsgdoctor/gebaerdenVideo.dart';
import 'package:dsgdoctor/news/newsPage.dart';
import 'package:dsgdoctor/profile/profile.dart';
import 'package:dsgdoctor/userProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsgdoctor/videos.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'appBarContent.dart';
import 'arztBesuch.dart';
import 'colors.dart';
import 'dashboardButton.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.Primary,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),

            onPressed: () async {
              var prefs  = await SharedPreferences.getInstance();
              var myProfile;

              String profileString = prefs.getString("profile");
              print(profileString);

              if(profileString != null){
                myProfile = new Profile.fromJson(jsonDecode(profileString));
              }
              else{
                myProfile = new Profile();
              }
              print(myProfile.toString());
              Navigator.push(context, MaterialPageRoute(builder: (context) =>

              UserProfile(myProfile)
              )
              );
            },
          )

        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: AppBarContent(),
        backgroundColor: ThemeColors.appBar,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 300,
              child: GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.all(25),
                children: dashboardActions(context),
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
                crossAxisCount: 2,
                childAspectRatio: MediaQuery
                    .of(context)
                    .size
                    .width /
                    (MediaQuery
                        .of(context)
                        .size
                        .height / 2),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Image.asset("assets/slogan.png"),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> dashboardActions(BuildContext context) {
    return <Widget>[
      DashboardButton(
        text: "Arztbesuch",
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ArztBesuch()));
        },
      ),
      DashboardButton(
        text: "Aktuelles zum Corona-Virus",
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewsPage()));
        },
      ),
      DashboardButton(
        text: "COVID-19 Selbstdiagnose",
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CorvidSelbsttest()));
        },
      ),

      DashboardButton(
        text: "PDF-Anleitung",
        onPressed: () {},
      ),

    ];
  }
}
