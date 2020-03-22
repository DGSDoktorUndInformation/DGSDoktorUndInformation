import 'package:dsgdoctor/videoplayer.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({this.message, this.delivered, this.isMe, this.videoUrl});

  final String message, videoUrl;
  final delivered, isMe;

  @override
  Widget build(BuildContext context) {
    final bg = isMe
        ? Color.fromRGBO(255, 255, 255, 1)
        : Color.fromRGBO(176, 216, 192, 1);
    final align = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final radius = BorderRadius.all(Radius.circular(15.0));
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        GestureDetector(
            onTap: () => videoUrl != null ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Videoplayer(videoUrl),
                  );
                }) : {},
            child: Container(
              padding: EdgeInsets.all(1.0),
              margin: EdgeInsets.all(2.0),
              decoration: BoxDecoration(color: bg, borderRadius: radius),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 48.0),
                      child: Text(message),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 3.0),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
