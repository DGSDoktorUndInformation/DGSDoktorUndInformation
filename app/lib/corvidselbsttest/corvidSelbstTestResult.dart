import 'package:DGSDocInfo/corvidselbsttest/corvidselbsttestmodel.dart';
import 'package:DGSDocInfo/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appBarContent.dart';
import '../colors.dart';

class CorvidSelbstTestResult extends StatelessWidget {
  CorvidSelbsttestModel corvidSelbsttestModel;

  CorvidSelbstTestResult(this.corvidSelbsttestModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: ThemeColors.Primary,
            title: AppBarContent(),
            leading: IconButton(
                onPressed: () =>
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                            (Route<dynamic> route) => false),
                icon: Icon(Icons.arrow_back),
                tooltip: 'Zurück')),
        body:
        FutureBuilder<String>(
          future: setToLocalStorage(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return Text(snapshot.data);
          },

        )
    );
  }

  Future<String> setToLocalStorage() async {
    var prefs = await SharedPreferences.getInstance();

    var json = corvidSelbsttestModel.getJson();
    prefs.setString("selbsttest", json);
    return json;
  }

}
