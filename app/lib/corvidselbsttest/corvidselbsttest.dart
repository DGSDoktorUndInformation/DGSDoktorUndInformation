import 'package:dsgdoctor/corvidselbsttest/corvidSelbstTestResult.dart';
import 'package:dsgdoctor/corvidselbsttest/corvidSelbsttestBloc.dart';
import 'package:dsgdoctor/corvidselbsttest/corvidSelbsttestFragen.dart';
import 'package:dsgdoctor/dashboardButton.dart';
import 'package:dsgdoctor/videoplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appBarContent.dart';
import '../colors.dart';
import 'Frage.dart';

class CorvidSelbsttest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CorvidSelbsttestState();
  }
}

class CorvidSelbsttestState extends State<CorvidSelbsttest> {
  CorvidSelbsttestBloc corvidSelbsttestBloc;

  CorvidSelbsttestState() {
    corvidSelbsttestBloc = new CorvidSelbsttestBloc(CorvidSelbsttestFragen());
  }

  Column createStep(Frage frage) {
    return Column(
      children: <Widget>[
        Text(frage.frage,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Videoplayer(frage.video),
        ),
        Wrap(
            children: frage.suggestions
                .map((x) => questionButton(frage.frage, x))
                .toList())
      ],
    );
  }

  Widget questionButton(question, text) => Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: MaterialButton(
          color: ThemeColors.darkgrey,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => onAnswerQuestion(question, text)));

  onAnswerQuestion(question, text) {
    corvidSelbsttestBloc.answerQuestion(question, text);

    if (corvidSelbsttestBloc.finished) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CorvidSelbstTestResult(corvidSelbsttestBloc.getModel())));
    }
    ;
  }

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
        body: StreamBuilder<Frage>(
            stream: corvidSelbsttestBloc.outStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                /* todo, kein waiting oder neuladen bei neuer message...*/

                default:
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}',
                        style: new TextStyle(color: Colors.white));
                  else if (!snapshot.hasData) {
                    return Center(
                        child: DashboardButton(
                            onPressed: () =>
                                {corvidSelbsttestBloc.getInitialData()},
                            text: "Test starten"));
                  } else {
                    return createStep(snapshot.data);
                  }
              }
            }));
  }
}
