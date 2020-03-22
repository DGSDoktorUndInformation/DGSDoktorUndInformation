import 'dart:convert';

import 'package:dsgdoctor/chat/chatMessageModel.dart';
import 'package:dsgdoctor/config.dart';
import 'package:dsgdoctor/profile/profile.dart';
import 'package:dsgdoctor/videos.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatApi {
  List<ChatMessageModel> chats;

  ChatApi() {
    chats = new List<ChatMessageModel>();
  }

  readChats(String chatId, int page) async {
    var chatMessageModel = ChatMessageModel.builder(chatId, "Wie hoch ist Ihre Temparatur?", DateTime.now().toIso8601String());
    chatMessageModel.suggestions = ["35°", "36°", "37°", "38°", "39°", "40°", "50°"];
    chatMessageModel.videoUrl = Videos.Fieber;
    chatMessageModel.fromApp = false;
    chats.add(chatMessageModel);
    return chats;
  }

  postMessage(String message, bool fromApp, String chatId) async {
    var chatMessageModel = ChatMessageModel.builder(chatId, message, DateTime.now().toIso8601String());
    chatMessageModel.messageId = chats.length.toString();
    chats.add(chatMessageModel);
  }

  Future<String> startSession(Profile profile) async {
    var prefs = await SharedPreferences.getInstance();
    String selbsttest = prefs.getString("selbsttest");

    Map<String, dynamic> json = {
      "patient": {
        "name": profile.name == null ? "" : profile.name
      },
      "kontaktPerson": {
        "name": profile.contactName == null ? "" : profile.contactName,
        "telefonNummer": profile.contactTelephone == null ? "" : profile.contactTelephone
      },
      "selbsttest": selbsttest
    };
    var baseUrl = Config.baseUrl;

    return "4";
    /*var response = await http.post("$baseUrl/session",
        headers: {
          "Content-type": "application/json"
        },
        body: jsonEncode(json));

    return jsonDecode(response.body)["patientenCode"];*/
  }

}
