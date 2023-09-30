import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:trucker/screen/login_screen/login_screen.dart';
import 'package:trucker/screen/login_screen/name_screen.dart';

class Otp extends StatefulWidget {
  final String phoneNumber; // Add a field to store the phone number
  final _timeLeft = "10";
  const Otp({required this.phoneNumber, Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  late PinTheme defaultPinTheme;
  late PinTheme focusedPinTheme;
  late PinTheme submittedPinTheme;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";

  @override
  void initState() {
    super.initState();

    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 54.0),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Enter the 6-digit-code sent to you at ${widget.phoneNumber}',
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF475467),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
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
                      GestureDetector(
                        onTap: () {
                          log("User want to Resend OTP");
                        },
                        child: Text(
                          "Resend Code (0.${widget._timeLeft})",
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF98A2B3),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 22.0,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (pin) => print(pin),
                onChanged: (value) {
                  code = value;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: Login.verify,
                      smsCode: code,
                    );
                    print("dads>>> $code $credential");
                    await auth.signInWithCredential(credential);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Name(email: '', phone: widget.phoneNumber)));
                  } catch (ex, st) {
                    print('wrong otp>>> $ex $st');
                  }
                },
                child: Container(
                  width: 361,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFFF8D49),
                  ),
                  child: const Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: Container(
                  width: 361,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFF2F4F7),
                  ),
                  child: const Center(
                    child: Text(
                      'Back',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF98A2B3)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
