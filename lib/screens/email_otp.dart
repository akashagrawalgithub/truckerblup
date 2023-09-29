import 'dart:developer';
import "package:flutter/material.dart";
import 'dart:async';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final useremail = "cha***@gmail.com";
  late int _timeLeft = 10;
  late Timer _timer;
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timeLeft <= 0) {
          timer.cancel();
          setState(() {
            _timeLeft = 0;
          });
        } else {
          setState(() {
            _timeLeft--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 354,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 33.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter the 6-digit code sent to you at ${useremail}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                color: Color(0xFf475467),
              ),
            ),
            const SizedBox(
              height: 22.0,
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
                      onTap: _timeLeft == 0
                          ? () {
                              log("User want to Resend OTP");
                            }
                          : null,
                      child: Text(
                        _timeLeft == 0
                            ? "Resend code"
                            : "Resend Code (0.${_timeLeft.toString().padLeft(2, '0')})",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: _timeLeft == 0
                              ? Color(0xFF475467)
                              : const Color(0xFF98A2B3),
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
            // write OTP Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                (index) => Container(
                  width: 53.00,
                  height: 50.00,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF2F3F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextField(
                    controller: _otpControllers[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < 5) {
                          FocusScope.of(context).nextFocus();
                        }
                      }
                    },
                  ),
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
                  log("Entered OTP: ${getEnteredOTP()}");
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
                      "Cancel",
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

  String getEnteredOTP() {
    String otp = '';
    for (var controller in _otpControllers) {
      otp += controller.text;
    }
    return otp;
  }
}
