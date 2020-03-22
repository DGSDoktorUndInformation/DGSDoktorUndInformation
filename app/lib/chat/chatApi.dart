import 'dart:convert';

import 'package:DGSDocInfo/chat/chatMessageModel.dart';
import 'package:DGSDocInfo/config.dart';
import 'package:DGSDocInfo/profile/profile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatApi {
  List<ChatMessageModel> chats;

  ChatApi() {
    chats = new List<ChatMessageModel>();
  }

  readChats(String sessionId, int page) async {
    /*var chatMessageModel = ChatMessageModel.builder(chatId, "Wie hoch ist Ihre Temparatur?", DateTime.now().toIso8601String());
    chatMessageModel.suggestions = ["35°", "36°", "37°", "38°", "39°", "40°", "50°"];
    chatMessageModel.videoUrl = Videos.Fieber;
    chatMessageModel.fromApp = false;
    chats.add(chatMessageModel);
    return chats;*/

    var baseUrl = Config.baseUrl;
    var response = await http.get("$baseUrl/session/$sessionId/message",
        headers: {
          "Content-type": "application/json"
        });

    if(response.statusCode != 200) {
      return chats;
    }

    List<dynamic> decoded = jsonDecode(response.body);
    decoded.forEach((x) => chats.add(toChatMessageModel(x)));

    return chats;
  }

  ChatMessageModel toChatMessageModel(dynamic message) {
    var chatMessageModel = ChatMessageModel();
    chatMessageModel.messageId = message["id"];
    chatMessageModel.fromApp = message["fromPatient"];
    chatMessageModel.videoUrl = message["videoPfad"];
    chatMessageModel.message = message["nachrichtenText"];
    chatMessageModel.date = message["date"];
    chatMessageModel.suggestions = message["antwortOptionen"].cast<String>();
    return chatMessageModel;
  }

  postMessage(String message, bool fromApp, String sessionId) async {
    /*var chatMessageModel = ChatMessageModel.builder(chatId, message, DateTime.now().toIso8601String());
    chatMessageModel.messageId = chats.length.toString();
    chats.add(chatMessageModel);*/

    Map<String, dynamic> json = {
      "nachrichtenText": message,
      "fromPatient": fromApp
    };
    var baseUrl = Config.baseUrl;
    await http.post("$baseUrl/session/$sessionId/message",
        headers: {
          "Content-type": "application/json"
        },
        body: jsonEncode(json));
  }

  Future<String> startSession(Profile profile) async {
    var prefs = await SharedPreferences.getInstance();
    String selbsttest = prefs.getString("selbsttest");

    Map<String, dynamic> json = {
      "patient": {
        "name": profile.name == null ? "" : profile.name,
        "geburtstag": profile.birthday == null ? "" : profile.birthday.toIso8601String()
      },
      "kontaktPerson": {
        "name": profile.contactName == null ? "" : profile.contactName,
        "telefonNummer": profile.contactTelephone == null ? "" : profile
            .contactTelephone
      },
      "selbstTest": jsonDecode(selbsttest)
    };
    var baseUrl = Config.baseUrl;

    //return "4";
    var response = await http.post("$baseUrl/session",
        headers: {
          "Content-type": "application/json"
        },
        body: jsonEncode(json));

    return jsonDecode(response.body)["patientenCode"];
  }
}
