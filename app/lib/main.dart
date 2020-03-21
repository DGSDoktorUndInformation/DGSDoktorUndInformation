import 'package:dsgdoctor/appBarContent.dart';
import 'package:dsgdoctor/arztBesuch.dart';
import 'package:dsgdoctor/colors.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'dashboardButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "DSG Doctor",
        home: Dashboard());
  }


}
