import 'dart:async';

import 'package:DGSDocInfo/corvidselbsttest/Frage.dart';
import 'package:DGSDocInfo/corvidselbsttest/corvidselbsttestmodel.dart';
import 'package:flutter/cupertino.dart';

import 'corvidSelbsttestFragen.dart';

class CorvidSelbsttestBloc {
  StreamController<Frage> streamController =
  StreamController<Frage>.broadcast();

  Stream<Frage> get outStream => streamController.stream;

  List<Frage> fragen;
  int idx = 0;
  CorvidSelbsttestModel model;
  bool finished = false;

  CorvidSelbsttestBloc(CorvidSelbsttestFragen repository) {
    fragen = repository.getAll();
    model = new CorvidSelbsttestModel();
    streamController.add(getInitialData());
  }

  answerQuestion(String question, String answer) {
    model.addAnswer(question, answer);
    idx++;

    if(fragen.length > idx) {
      streamController.add(fragen[idx]);
    } else {
      finished = true;
    }
  }

  getModel() {
    return model;
  }

  void dispose() {
    streamController.close();
  }

  getInitialData() {
    return streamController.add(fragen[idx]);
  }
}
