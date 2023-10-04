import 'package:flutter/material.dart';
import 'package:trucker_email_login/comunication_module/message_widget/bottom_nav.dart';
import 'package:trucker_email_login/comunication_module/message_widget/date.dart';
import 'package:trucker_email_login/comunication_module/message_widget/one_recieve.dart';
import 'package:trucker_email_login/comunication_module/message_widget/send.dart';
import 'package:trucker_email_login/comunication_module/message_widget/send_reply.dart';
import 'package:trucker_email_login/comunication_module/message_widget/simple_recieve.dart';
import 'package:trucker_email_login/comunication_module/message_widget/two_recieve.dart';

class Chat extends StatefulWidget {
  Chat({Key? key});

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
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const DateTimeliner(time: "Yesterday"),
                  SendMessage(
                    message:
                        "There are several Italian restaurants in the area. One that comes to mind is La",
                    time: "3.00 AM",
                    seenmessage: true,
                  ),
                  SimpleRecieve(
                    sendName: "Akash",
                    SendMessage:
                        "There are several Italian restaurants in the area. One that comes to mind is La",
                    sendMessageTime: "4.00 AM",
                  ),
                  multipleOneRecieve(
                    sendName: "Akash",
                    SendMessage:
                        "There are several Italian restaurants in the area. One that comes to mind is La",
                    sendMessageTime: "4.00 AM",
                  ),
                  multipleRecieve(
                    sendName: "Akash",
                    SendMessage:
                        "There are several Italian restaurants in the area. One that comes to mind is La",
                    sendMessageTime: "4.00 AM",
                  ),
                  SendReply(
                    towhomreply: "Akash Agrwal",
                    replymessage:
                        "There are several Italian restaurants in the area. One that comes to mind is La",
                    replyingtomessage:
                        "There are several Italian restaurants in the area. One that comes to mind is La",
                    time: "4.00 AM",
                  ),
                  SendMessage(
                    message:
                        "There are several Italian restaurants in the area. One that comes to mind is La",
                    time: "3.00 AM",
                    seenmessage: true,
                  ),
                  const DateTimeliner(time: "Today"),
                  SendMessage(
                    message:
                        "There are several Italian restaurants in the area. One that comes to mind is La",
                    time: "3.00 AM",
                    seenmessage: false,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Bottom area with text input
        const TypeSection(),
      ],
    );
  }
}
