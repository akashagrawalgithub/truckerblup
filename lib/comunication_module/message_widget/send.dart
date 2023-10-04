import "package:flutter/material.dart";

class SendMessage extends StatefulWidget {
  bool seenmessage;
  final time;
  final String message;
  SendMessage(
      {super.key,
      required this.message,
      required this.time,
      required this.seenmessage});

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
                margin: const EdgeInsets.only(top: 8.0),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  name and time and seen info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //user name
                        const Text(
                          "You",
                          style: TextStyle(
                            color: Color(0xFFEC6A00),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            // tick
                            Icon(
                              Icons.done_all_outlined,
                              size: 14.0,
                              color: !widget.seenmessage
                                  ? const Color(0xFFD0D5DD)
                                  : const Color(0xFF475467),
                            ),
                            const SizedBox(width: 4),
                            //time
                            Text(
                              widget.time,
                              style: const TextStyle(
                                color: Color(0xFF475466),
                                fontSize: 11,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    // acutal messages
                    const SizedBox(height: 12),
                    Text(
                      widget.message,
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
