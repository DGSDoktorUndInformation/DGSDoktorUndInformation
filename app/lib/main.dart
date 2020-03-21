import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DSG Doctor",
      home: Scaffold (
        appBar: AppBar(
          title: Text("DSG Doctor"),
        ),
        body: Center(child: Text("Informationen für Gehörlose")),
      )
    );
  }
}
