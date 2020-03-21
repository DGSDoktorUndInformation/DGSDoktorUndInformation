import 'package:dsgdoctor/appBarContent.dart';
import 'package:dsgdoctor/colors.dart';
import 'package:dsgdoctor/date2String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserProfileState();
  }
}

class UserProfileState extends State<UserProfile> {
  TextEditingController dateController = new TextEditingController();

  var birthday;

  getProfileValues(){

  }

  saveProfileValues(){

  }

  @override
  Widget build(BuildContext context) {
    String _value = '';

    TextStyle textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    dateController.text = "";

    var nameField = TextField(
      style: textStyle,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Name",
      ),
    );

    var contactNameField = TextField(
      style: textStyle,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Kontaktperson",
      ),
    );

    var contactNumberField = TextField(
      style: textStyle,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Kontaktperson - Telefon",
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
            birthday = dateTime;
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
                onPressed: () {

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
