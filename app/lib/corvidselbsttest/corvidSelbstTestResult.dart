import 'package:dsgdoctor/corvidselbsttest/corvidselbsttestmodel.dart';
import 'package:dsgdoctor/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appBarContent.dart';
import '../colors.dart';

class CorvidSelbstTestResult extends StatelessWidget {
  CorvidSelbsttestModel corvidSelbsttestModel;

  CorvidSelbstTestResult(CorvidSelbsttestModel this.corvidSelbsttestModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: ThemeColors.Primary,
        title: AppBarContent(),
    leading: IconButton(
    onPressed: () => Dashboard(),
    icon: Icon(Icons.arrow_back),
    tooltip: 'Zurück')),
    body: Text(corvidSelbsttestModel.getJson()));
  }

}
