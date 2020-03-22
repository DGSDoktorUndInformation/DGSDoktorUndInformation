import 'dart:async';

import 'package:DGSDocInfo/chat/chatApi.dart';
import 'package:DGSDocInfo/chat/chatMessageModel.dart';

class ChatBloc {
  StreamController<List<ChatMessageModel>> streamController =
  StreamController<List<ChatMessageModel>>.broadcast();
  StreamController<List<ChatMessageModel>> cmdstreamController =
  StreamController<List<ChatMessageModel>>.broadcast();


  Stream<List<ChatMessageModel>> get outCurrentBloc => streamController.stream;
  StreamSink get cmdCurrentBloc => cmdstreamController.sink;

  ChatApi chatApi;
  String sessionId;
  List<int> loadedPages;
  Timer timer;

  ChatBloc(ChatApi this.chatApi, this.sessionId) {
    cmdstreamController.stream.listen((x) => onMessage(x));

    loadedPages = [0, 1];
    applyChatsToStream(loadedPages);

    timer = new Timer.periodic(new Duration(seconds: 1), (t) => applyChatsToStream([0]));
  }

  void onMessage(List<ChatMessageModel> x) {
    if(x.isEmpty) {
      return;
    }

    for(var message in x) {
      if(!_chatMessages.any((x) => x.messageId == message.messageId)) {
        _chatMessages.add(message);
      }
    }

    streamController.sink.add(_chatMessages);
  }

  void applyChatsToStream(List<int> pages) {
    var chats = readChats(pages);

    var list = chats.toList();
    list.then((y) => cmdCurrentBloc.add(y));
  }

  Stream<ChatMessageModel> readChats(List<int> pages) async* {
    for (var page in pages) {
      var chats = await chatApi.readChats(sessionId, page);
      for(var chat in chats) {
        yield chat;
      }
    }
  }

  void sendMessage(String message) async {
    await chatApi.postMessage(message, true, this.sessionId);
    applyChatsToStream([0]);
  }

  void dispose() {
    streamController.close();
    cmdstreamController.close();
    timer.cancel();
  }

  void readMore() {
    var newLoadedPage = loadedPages.last + 1;
    loadedPages.add(newLoadedPage);
    applyChatsToStream([newLoadedPage]);
  }

  List<ChatMessageModel> _chatMessages = new List<ChatMessageModel>();
}
