import 'dart:convert';

import 'package:dsgdoctor/chat/chatMessageModel.dart';
import 'package:dsgdoctor/config.dart';
import 'package:dsgdoctor/profile/profile.dart';
import 'package:http/http.dart' as http;

class ChatApi {
  List<ChatMessageModel> chats;

  ChatApi() {
    chats = new List<ChatMessageModel>();
  }

  readChats(String chatId, int page) async {
    var chatMessageModel = ChatMessageModel.builder(chatId, "Wie ist ihr Fieber?", DateTime.now().toIso8601String());
    chatMessageModel.suggestions = ["30ssssssssssssssssssssssssssss", "40", "50", "60", "70", "80", "90"];
    chats.add(chatMessageModel);
    return chats;
  }

  postMessage(String message, bool fromApp, String chatId) async {
    var chatMessageModel = ChatMessageModel.builder(chatId, message, DateTime.now().toIso8601String());
    chatMessageModel.messageId = chats.length.toString();
    chats.add(chatMessageModel);
  }

  Future<String> startSession(Profile profile) async {
    Map<String, dynamic> json = {
      "patient": {
        "name": profile.name == null ? "" : profile.name
      },
      "kontaktPerson": {
        "name": profile.contactName == null ? "" : profile.contactName,
        "telefonNummer": profile.contactTelephone == null ? "" : profile.contactTelephone
      }
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
