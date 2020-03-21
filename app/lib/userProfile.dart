import 'dart:convert';

import 'package:dsgdoctor/appBarContent.dart';
import 'package:dsgdoctor/colors.dart';
import 'package:dsgdoctor/date2String.dart';
import 'package:dsgdoctor/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  Profile profile;

  UserProfile(this.profile);

  @override
  State<StatefulWidget> createState() {
    return UserProfileState(profile: profile);
  }
}

class UserProfileState extends State<UserProfile> {
  TextEditingController dateController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController contactNameController = new TextEditingController();
  TextEditingController contactPhoneNumberController = new TextEditingController();
  Profile profile;

  UserProfileState({this.profile});

  var birthday;

  fillValues(){
    nameController.text = this.profile.name;
    dateController.text = this.profile.birthday == null ? "" : DateFormat('dd.MM.yyyy').format(this.profile.birthday);
    contactNameController.text = this.profile.contactName;
    contactPhoneNumberController.text = this.profile.contactTelephone;
  }

  saveProfileValues() async{
    final prefs = await SharedPreferences.getInstance();


    this.profile.name = nameController.text;
    this.profile.contactName = contactNameController.text;
    this.profile.contactTelephone = contactPhoneNumberController.text;

    prefs.setString("profile",jsonEncode(this.profile.toJson()));

  }

  @override
  Widget build(BuildContext context) {
    String _value = '';

    TextStyle textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    fillValues();

    var nameField = TextField(
      style: textStyle,
      controller: nameController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Name",
      ),
    );

    var contactNameField = TextField(
      controller: contactNameController,
      style: textStyle,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Name",
      ),
    );

    var contactNumberField = TextField(
      controller: contactPhoneNumberController,
      style: textStyle,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Telefon",
      ),
    );

    TextField birthdayField(BuildContext context) {
      return TextField(
        onTap: () async {
          DateTime dateTime = await showDatePicker(
              context: context,
              initialDate: DateTime(DateTime.now().year - 25),
              firstDate: DateTime(DateTime.now().year - 100),
              lastDate: DateTime(DateTime.now().year - 16),
              locale: Locale("de"));

          if (dateTime != null) {
            dateController.text = convertDateToString(dateTime);
            this.profile.birthday = dateTime;
          }
        },
        readOnly: true,
        style: textStyle,
        controller: dateController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Geburtsdatum",
        ),
      );
    }

    String initValue = "Select your Birth Date";
    bool isDateSelected = false;
    DateTime birthDate; // instance of DateTime
    String birthDateInString;

    return Scaffold(
        backgroundColor: ThemeColors.Primary,
        appBar: AppBar(
            backgroundColor: ThemeColors.Primary,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.done,
                  color: ThemeColors.Icon,
                ),
                onPressed: () async{
                  await saveProfileValues();
                  Navigator.pop(context);

                },

                tooltip: "Speichern",
                //onPressed: () async => onSave(context),
              )
            ],
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: AppBarContent(),
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: ThemeColors.Icon,
                ),
                tooltip: 'Zurück')),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              nameField,
              SizedBox(
                height: 20,
              ),
              birthdayField(context),
              SizedBox(
                height: 20,
              ),
              Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: <Widget>[
                      Text(
                        "Kontaktperson",
                        textAlign: TextAlign.left,
                        style: textStyle,
                      ),
                      contactNameField,
                      SizedBox(
                        height: 10,
                      ),
                      contactNumberField
                    ]),
                  )),
            ],
          ),
        )));
  }
}
