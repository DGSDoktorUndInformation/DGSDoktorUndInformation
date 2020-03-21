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
        title: AppBarContent(),
        backgroundColor: ThemeColors.Primary,
      ),
      body: GridView.count(
        padding: EdgeInsets.all(12),
        children: dashboardActions(context),
        crossAxisSpacing: 12,
        crossAxisCount: 2,
      ),
    );
  }

  List<Widget> dashboardActions(BuildContext context) {
    return <Widget>[
      DashboardButton(
        child: Text("Arztbesuch"),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ArztBesuch()));
        },
      ),
      DashboardButton(
        child: Text("Hallo"),
        onPressed: () {},
      ),
    ];
  }
}
