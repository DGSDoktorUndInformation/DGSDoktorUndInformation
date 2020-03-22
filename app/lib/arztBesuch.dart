import 'dart:convert';

import 'package:dsgdoctor/appBarContent.dart';
import 'package:dsgdoctor/chat/chat.dart';
import 'package:dsgdoctor/chat/chatApi.dart';
import 'package:dsgdoctor/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

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
      backgroundColor: ThemeColors.Primary,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: ThemeColors.Primary,
            title: AppBarContent(),
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
                tooltip: 'Zurück')),
        body: FutureBuilder<String>(
            future: startSession(),
            builder:
                (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              return Chat(snapshot.data);
            }));
  }

  Future<String> startSession() async {
    var prefs = await SharedPreferences.getInstance();
    var userprofileAsString = prefs.getString("profile");
    if(userprofileAsString == null) {
      return ChatApi().startSession(new Profile());
    }

    var string = Profile.fromJson(jsonDecode(userprofileAsString));
    return ChatApi().startSession(string);
  }
}
