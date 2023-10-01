import 'package:flutter/material.dart';
import 'package:trucker_email_login/component/mygridview.dart';
import "list.dart";

class MoreItemDragMenu extends StatefulWidget {
  const MoreItemDragMenu({super.key});

  @override
  State<MoreItemDragMenu> createState() => _MoreItemDragMenuState();
}

class _MoreItemDragMenuState extends State<MoreItemDragMenu> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          Container(
            width: 36,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(43),
              color: const Color(0xFFD0D5DD),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 361,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(43),
              color: const Color(0xFFf2f4f7),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(onTap: () {}, child: const Icon(Icons.arrow_back)),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: 'More Categories',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      height: 21.0 / 18.0,
                      letterSpacing: 0.0,
                      color: Color(0xFF98A2B3),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Places',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF475467),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              MyGridView(items: Places),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 361,
            height: 1,
            decoration: BoxDecoration(
              color: const Color(0xFFEAECF0),
              border: Border.all(
                color: const Color(0xFFEAECF0),
                width: 1,
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Amenities',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF475467),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: MyGridView(items: Amenities)),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 361,
            height: 1,
            decoration: BoxDecoration(
              color: const Color(0xFFEAECF0),
              border: Border.all(
                color: const Color(0xFFEAECF0),
                width: 1,
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Food & Drink',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF475467),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: MyGridView(items: Food)),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 361,
            height: 1,
            decoration: BoxDecoration(
              color: const Color(0xFFEAECF0),
              border: Border.all(
                color: const Color(0xFFEAECF0),
                width: 1,
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Truck Services',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF475467),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: MyGridView(items: Truck)),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 361,
            height: 1,
            decoration: BoxDecoration(
              color: const Color(0xFFEAECF0),
              border: Border.all(
                color: const Color(0xFFEAECF0),
                width: 1, // Border width
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Dealers',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF475467),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: MyGridView(items: Dealers)),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ]),
      ),
    );
  }
}
