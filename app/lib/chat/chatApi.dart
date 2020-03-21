import 'package:dsgdoctor/chat/chatMessageModel.dart';
import 'package:dsgdoctor/profile/profile.dart';

class ChatApi {
  List<ChatMessageModel> chats;

  ChatApi() {
    chats = new List<ChatMessageModel>();
  }

  readChats(String chatId, int page) async {
    return chats;
  }

  postMessage(String message, bool fromApp, String chatId) async {
    var chatMessageModel = ChatMessageModel.builder(chatId, message, DateTime.now().toIso8601String());
    chatMessageModel.messageId = chats.length.toString();
    chats.add(chatMessageModel);
  }

  Future<String> startSession(Profile profile) async {
    return "4";
  }

}
