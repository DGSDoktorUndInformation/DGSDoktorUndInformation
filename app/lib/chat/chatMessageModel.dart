class ChatMessageModel {
  String messageId;
  String chatId;
  String message;
  String date;
  bool fromApp;
  String videoUrl;
  List<String> suggestions;

  ChatMessageModel({this.messageId,
    this.chatId,
    this.message,
    this.date,
    this.fromApp,
    this.videoUrl,
    this.suggestions});

  factory ChatMessageModel.fromJson(json) {
    ChatMessageModel chatMessage = ChatMessageModel(
        messageId: json["messageId"],
        chatId: json["chatId"],
        message: json["message"],
        date: json["date"],
        fromApp: json["fromApp"],
        videoUrl: json["videoUrl"],
        suggestions: json["suggestions"]);

    return chatMessage;
  }

  factory ChatMessageModel.builder(chatId, message, date) {
    return ChatMessageModel(chatId: chatId, message: message, date: date, fromApp: true);
  }
}
