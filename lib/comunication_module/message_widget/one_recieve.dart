import "package:flutter/material.dart";

class multipleOneRecieve extends StatefulWidget {
  final String sendName;
  final String SendMessage;
  final String sendMessageTime;
  multipleOneRecieve(
      {super.key,
      required this.sendName,
      required this.SendMessage,
      required this.sendMessageTime});

  @override
  State<multipleOneRecieve> createState() => _multipleOneRecieveState();
}

class _multipleOneRecieveState extends State<multipleOneRecieve> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(width: 30),
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
                      bottomLeft: Radius.circular(2),
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
