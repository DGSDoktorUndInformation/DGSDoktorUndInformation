import 'package:dsgdoctor/userProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => UserProfile()));
            },
          )

        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: AppBarContent(),
        backgroundColor: ThemeColors.Primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 300,
              child: GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.all(12),
                children: dashboardActions(context),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 3),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
        onPressed: () {},
      ),
      DashboardButton(
        text: "COVID-19 Selbstdiagnose",
        onPressed: () {},
      ),
      DashboardButton(
        text: "Einstellungen",
        onPressed: () {},
      ),
      DashboardButton(
        text: "PDF-Anleitung",
        onPressed: () {},
      ),
    ];
  }
}
