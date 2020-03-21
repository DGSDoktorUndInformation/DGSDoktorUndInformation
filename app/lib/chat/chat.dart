import 'package:dsgdoctor/chat/chatApi.dart';
import 'package:dsgdoctor/chat/chatBloc.dart';
import 'package:dsgdoctor/colors.dart';
import 'package:dsgdoctor/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chatBubble.dart';
import 'chatMessageModel.dart';

class Chat extends StatefulWidget {
  String sessionId;

  Chat(this.sessionId);

  @override
  State<StatefulWidget> createState() {
    return ChatState(sessionId);
  }
}

class ChatState extends State<Chat> {
  String sessionId;
  ChatBloc chatBloc;
  ScrollController scrollController;
  TextEditingController messageController = new TextEditingController();
  List<ChatMessageModel> chatMessages;

  ChatState(this.sessionId) {
    chatBloc = ChatBloc(ChatApi(), this.sessionId);
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    chatMessages = snapshot.data;
    chatMessages.sort((x, y) => y.date.compareTo(x.date));

    return new ListView.builder(
      itemCount: chatMessages.length,
      controller: scrollController,
      reverse: true,
      itemBuilder: (BuildContext context, int index) {
        var isMe = chatMessages[index].fromApp;
        var messageAlignment;
        var time = chatMessages[index].date.substring(11, 16);

        if (isMe) {
          messageAlignment = Alignment.centerRight;
        } else {
          messageAlignment = Alignment.centerLeft;
        }

        return new Padding(
          padding: EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
          child: new Align(
            alignment: messageAlignment,
            child: new ChatBubble(
              message: chatMessages[index].message,
              time: time,
              delivered: true,
              isMe: isMe,
            ),
          ),
        );
      },
    );
  }

  Widget yesNoArea() {
    return Row(
      children: <Widget>[questionButton("Ja"), questionButton("Nein")],
    );
  }

  Widget questionButton(text) => Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: MaterialButton(
              color: ThemeColors.darkgrey,
              child: Text(text),
              onPressed: () => sendMessage(text)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    var messageTextField = TextFormField(
        controller: messageController,
        textInputAction: TextInputAction.newline,
        onFieldSubmitted: (String value) async {
          await sendMessage(messageController.text);
        },
        minLines: 1,
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(hintText: "Send message..."));

    var streamBuilder = new StreamBuilder(
        stream: chatBloc.outCurrentBloc,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:

            default:
              print(snapshot);
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else if (!snapshot.hasData) {
                return Center(
                    child: Text("Sessionid: $sessionId",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40)));
              } else
                return createListView(context, snapshot);
          }
        });

    return Column(children: <Widget>[
      Expanded(child: streamBuilder),
      yesNoArea(),
      Row(
        children: <Widget>[
          Flexible(
              child: Padding(
                  padding: EdgeInsets.only(right: 10.0, left: 10.0),
                  child: messageTextField)),
          IconButton(
            icon: new Icon(Icons.send),
            onPressed: () => sendMessage(messageController.text),
          )
        ],
      )
    ]
        // input field + send button
        );
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      chatBloc.readMore();
    }
  }

  sendMessage(String text) async {
    var message = text;
    if (message.isEmpty) {
      return;
    }

    messageController.text = "";
    chatBloc.sendMessage(message);
  }
}
