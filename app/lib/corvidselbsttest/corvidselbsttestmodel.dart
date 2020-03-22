import 'dart:convert';

class CorvidSelbsttestModel {
  Map<String, String> answers;

  CorvidSelbsttestModel() {
    answers = new Map<String, String>();
    answers["datum"] = DateTime.now().toIso8601String();
  }

  addAnswer(String question, String answer) {
    answers[question] = answer;
  }

  getJson() {
    return jsonEncode(answers);
  }
}
