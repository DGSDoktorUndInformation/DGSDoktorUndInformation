class ChatMessageModel {
  String messageId;
  String chatId;
  String message;
  String date;
  bool fromApp;
  String videoUrl;

  ChatMessageModel({this.messageId, this.chatId, this.message, this.date, this.fromApp, this.videoUrl});

  factory ChatMessageModel.fromJson(json) {
    ChatMessageModel chatMessage = ChatMessageModel(
        messageId: json["messageId"],
        chatId: json["chatId"],
        message: json["message"],
        date: json["date"],
        fromApp: json["fromApp"],
        videoUrl: json["videoUrl"]);

    return chatMessage;
  }

  factory ChatMessageModel.builder(chatId, message, date) {
    return ChatMessageModel(chatId: chatId, message: message, date: date, fromApp: true);
  }
}
