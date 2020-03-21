import 'package:dsgdoctor/appBarContent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArztBesuch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ArztBesuchState();
  }
}

class ArztBesuchState extends State<ArztBesuch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: AppBarContent(),
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
                tooltip: 'Zurück')),
        body: Text("Hello World"));
  }
}
