import "package:flutter/material.dart";

class FillOTP extends StatefulWidget {
  const FillOTP({super.key});

  @override
  State<FillOTP> createState() => _FillOTPState();
}

class _FillOTPState extends State<FillOTP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 53.00,
      height: 50.00,
      decoration: ShapeDecoration(
        color: const Color(0xFFF2F3F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
