import 'package:DGSDocInfo/appBarContent.dart';
import 'package:DGSDocInfo/arztBesuch.dart';
import 'package:DGSDocInfo/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "DSG Doctor",
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('de'),
        ],
        theme: theme(context),
        home: Dashboard());
  }

  ThemeData theme(context) {
    var color = Colors.blueGrey;
    return ThemeData(


      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
        primarySwatch: color);
  }


}
