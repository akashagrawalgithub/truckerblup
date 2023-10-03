import "package:flutter/material.dart";

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const ShapeDecoration(
                  color: Color(0xFFEAECF0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(2),
                    ),
                  ),
                ),
                child: const Column(
                  children: [
                    //  name and time and seen info
                    // acutal messages
                    Text(
                        "https://media.istockphoto.com/id/1430993255/photo/portrait-of-handsome-business-man-laughing-on-gray-background.jpg?s=170667a&w=0&k=20&c=Iw917Yd0B5W5Fg1mi-Z8QJuOjn6ax0Pd0Y4hPUZnHLU=")
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          const CircleAvatar(
            radius: 12,
            backgroundImage: NetworkImage(
                "https://media.istockphoto.com/id/1430993255/photo/portrait-of-handsome-business-man-laughing-on-gray-background.jpg?s=170667a&w=0&k=20&c=Iw917Yd0B5W5Fg1mi-Z8QJuOjn6ax0Pd0Y4hPUZnHLU="),
          )
        ],
      ),
    );
  }
}
