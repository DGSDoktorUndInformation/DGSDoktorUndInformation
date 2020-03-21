import 'package:dsgdoctor/appBarContent.dart';
import 'package:dsgdoctor/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserProfileState();
  }
}

class UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: ThemeColors.Primary,
        appBar: AppBar(
            backgroundColor: ThemeColors.Primary,
            actions: <Widget>[

              IconButton(
                icon: Icon(Icons.done, color: ThemeColors.Icon,),

                tooltip: "Speichern",
                //onPressed: () async => onSave(context),
              )

            ],
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: AppBarContent(),
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back, color: ThemeColors.Icon,),

                tooltip: 'Zurück')),

        body:
        Row(children: <Widget>[


        ],)

    );
  }
}
