import "dart:developer";
import "package:flutter/material.dart";
// import "package:trucker_email_login/screens/email_otp.dart";
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController forgetemailaddresscontroller = TextEditingController();
  void resetpassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: forgetemailaddresscontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      log("Something went wrong ${e.code}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 354,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Forget password",
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 24,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                color: Color(0xFF475467),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: forgetemailaddresscontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(
                    color: Color(0xFF98A2B3),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFFF8D49),
              ),
              child: TextButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => const VerifyOTP()),
                  // );
                  resetpassword();
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 2.0),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFFF2F4F7),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Center(
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.0,
                        color: Color(0xFF98A2B3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
