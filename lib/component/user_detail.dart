import "dart:developer";

import "package:flutter/material.dart";

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userEmailController = TextEditingController();

    return Container(
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            // isDismissible: false,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Padding(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // user detils form
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                      color: Color(0xFF475466),
                                      fontSize: 24,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Text(
                                    "Profile photo",
                                    style: TextStyle(
                                      color: Color(0xFF98A1B2),
                                      fontSize: 14,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.blue,
                                        child: Icon(
                                          Icons.person,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 2, 10, 2),
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFF2F3F6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: TextButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              const Color(0xFFF2F4F7),
                                            ),
                                          ),
                                          child: const Text(
                                            "Add Profile photo",
                                            style: TextStyle(
                                              color: Color(0xFF475466),
                                              fontSize: 16,
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  // user name field
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Name",
                                        style: TextStyle(
                                          color: Color(0xFF667084),
                                          fontSize: 14,
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        width: double.infinity,
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF2F3F6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: const TextField(
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                              color: Color(0xFF98A1B2),
                                              fontSize: 16,
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w500,
                                            ),
                                            hintText: "Enter your Name",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  // user name field
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Phone number",
                                        style: TextStyle(
                                          color: Color(0xFF667084),
                                          fontSize: 14,
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        width: double.infinity,
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF2F3F6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: const TextField(
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                              color: Color(0xFF98A1B2),
                                              fontSize: 16,
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w500,
                                            ),
                                            hintText: "Enter your number",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  // user Email field
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Email",
                                        style: TextStyle(
                                          color: Color(0xFF667084),
                                          fontSize: 14,
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        width: double.infinity,
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF2F3F6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: TextField(
                                          controller: userEmailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: const InputDecoration(
                                            hintStyle: TextStyle(
                                              color: Color(0xFF98A1B2),
                                              fontSize: 16,
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w500,
                                            ),
                                            hintText: "Enter your Email",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                        print("Cancel button pressed");
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
                          // both button
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Text("Fill user detail"),
      ),
    );
  }
}
