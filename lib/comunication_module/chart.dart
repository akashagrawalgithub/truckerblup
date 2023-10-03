import 'package:flutter/material.dart';
import 'package:trucker_email_login/comunication_module/message_widget/date.dart';
import 'package:trucker_email_login/comunication_module/message_widget/send.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top area with fixed username
        Container(
          width: double.infinity,
          height: 100,
          color: Colors.red,
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
              child: Column(
                children: [
                  DateTimeliner(time: "Yesterday"),
                  SendMessage(),
                ],
              ),
            ),
          ),
        ),
        // Bottom area with text input
        Container(
          width: double.infinity,
          height: 100,
          color: Colors.blue,
        ),
      ],
    );
  }
}
