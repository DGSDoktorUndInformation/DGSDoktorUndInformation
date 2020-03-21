class ChatMessageModel {
  String messageId;
  String chatId;
  String message;
  String date;
  bool fromApp;

  ChatMessageModel({this.messageId, this.chatId, this.message, this.date, this.fromApp});

  factory ChatMessageModel.fromJson(json) {
    ChatMessageModel chatMessage = ChatMessageModel(
        messageId: json["messageId"],
        chatId: json["chatId"],
        message: json["message"],
        date: json["date"],
        fromApp: json["fromApp"]);

    return chatMessage;
  }

  factory ChatMessageModel.builder(chatId, message, date) {
    return ChatMessageModel(chatId: chatId, message: message, date: date, fromApp: true);
  }
}
