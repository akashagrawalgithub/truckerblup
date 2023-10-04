import "package:flutter/material.dart";

class multipleRecieve extends StatefulWidget {
  final String sendName;
  final String SendMessage;
  final String sendMessageTime;
  multipleRecieve(
      {super.key,
      required this.sendName,
      required this.SendMessage,
      required this.sendMessageTime});

  @override
  State<multipleRecieve> createState() => _multipleRecieveState();
}

class _multipleRecieveState extends State<multipleRecieve> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CircleAvatar(
            radius: 12,
            backgroundImage: NetworkImage(
                "https://media.istockphoto.com/id/1430993255/photo/portrait-of-handsome-business-man-laughing-on-gray-background.jpg?s=170667a&w=0&k=20&c=Iw917Yd0B5W5Fg1mi-Z8QJuOjn6ax0Pd0Y4hPUZnHLU="),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: IntrinsicHeight(
              child: Container(
                margin: const EdgeInsets.only(top: 2.0),
                padding: const EdgeInsets.all(12),
                decoration: const ShapeDecoration(
                  color: Color(0xFFEAECF0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2),
                      bottomLeft: Radius.circular(2),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  name and time and seen info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //user name
                        Text(
                          widget.sendName,
                          style: const TextStyle(
                            color: Color(0xFF475466),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.sendMessageTime,
                          style: const TextStyle(
                            color: Color(0xFF475466),
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    // acutal messages
                    const SizedBox(height: 12),
                    Text(
                      widget.SendMessage,
                      style: const TextStyle(
                        color: Color(0xFF475466),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
