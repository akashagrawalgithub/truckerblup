import "dart:developer";

import "package:flutter/material.dart";

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tipAmount = 30;

    return Container(
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            // isDismissible: false,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                  child: IntrinsicHeight(
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.team-bhp.com/forum/attachments/road-safety/1583654d1481355587-how-handle-prevent-tyre-burst-blowout-img_7863.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFFEAECF0),
                                  width: 0.9,
                                ),
                              ),
                            ),
                            child: const Text("sound option"),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const ListTile(
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.person,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              "John Smith",
                              style: TextStyle(
                                color: Color(0xFF475466),
                                fontSize: 18,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Icon(
                              Icons.warning_amber,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                const Text(
                                  "I need help for tyre puncture",
                                  style: TextStyle(
                                    color: Color(0xFF475466),
                                    fontSize: 20,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Text(
                                      "Help john smith and get ",
                                      style: TextStyle(
                                        color: Color(0xFF98A1B2),
                                        fontSize: 14,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "\$${tipAmount.toString()}",
                                      style: const TextStyle(
                                        color: Color(0xFF344054),
                                        fontSize: 14,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Color(0xFFF2F3F6),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      print("No button pressed");
                                    },
                                    child: const Text(
                                      "No",
                                      style: TextStyle(
                                        color: Color(0xFF98A1B2),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Color(0xFFEAECF0),
                                  child: TextButton(
                                    onPressed: () {
                                      log("Yes Button pressed");
                                    },
                                    child: const Text(
                                      "Yes",
                                      style: TextStyle(
                                        color: Color(0xFF475466),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Text(
          "Someone needs help bottom navigation",
        ),
      ),
    );
  }
}
