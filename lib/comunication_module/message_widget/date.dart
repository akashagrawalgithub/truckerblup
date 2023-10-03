import "package:flutter/material.dart";

class DateTimeliner extends StatefulWidget {
  final time;
  const DateTimeliner({super.key, required this.time});

  @override
  State<DateTimeliner> createState() => _DateTimelinerState();
}

class _DateTimelinerState extends State<DateTimeliner> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: ShapeDecoration(
          color: const Color(0xFFEAECF0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          widget.time,
          style: const TextStyle(
            color: Color(0xFF475466),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
