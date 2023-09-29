import "dart:developer";

import "package:flutter/material.dart";

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userMobilenumber = "8957792911";
    final _timeLeft = "10";
    return Container(
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
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
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Enter the 6-digit code sent to you at ${userMobilenumber}",
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF475467),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                IntrinsicWidth(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 12, 16, 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color(0xFFEAECF0),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time,
                                          color: Color(0xFF475467),
                                        ),
                                        const SizedBox(width: 8.0),
                                        Text("Resend code(0.${_timeLeft})"),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    6,
                                    (index) => Container(
                                      width: 48.00,
                                      height: 50.00,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFF2F3F6),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        maxLength: 1,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            if (index < 5) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // cancel and Done button
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Color(0xFFF2F3F6),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Cancel",
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
                                      log("Done Button pressed");
                                    },
                                    child: const Text(
                                      "Done",
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
        child: const Text("Open OTP Bottom Sheet"),
      ),
    );
  }
}
