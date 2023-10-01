import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  final List<String> items;

  MyGridView({required this.items});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.0,
      runSpacing: 15.0,
      children: items.map((item) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(42),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                offset: Offset(0, 1),
                blurRadius: 3,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Color(0x1F000000),
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Text(
            item,
            style: const TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF475467),
            ),
          ),
        );
      }).toList(),
    );
  }
}
