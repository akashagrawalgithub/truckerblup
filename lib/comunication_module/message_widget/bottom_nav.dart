import "package:flutter/material.dart";

class TypeSection extends StatefulWidget {
  const TypeSection({super.key});

  @override
  State<TypeSection> createState() => _TypeSectionState();
}

class _TypeSectionState extends State<TypeSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(2, 4, 16, 4),
              decoration: ShapeDecoration(
                color: const Color(0xFFEAECF0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Message",
                  hintStyle: TextStyle(
                    color: Color(0xFF98A1B2),
                    fontSize: 18,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: Icon(
                    Icons.insert_emoticon_outlined,
                    color: Color(0xFF475467),
                    size: 24.0,
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.mic_none_outlined,
                        color: Color(0xFF475467),
                        size: 24,
                      ),
                      SizedBox(width: 12.0),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Color(0xFF475467),
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            width: 56,
            height: 56,
            decoration: ShapeDecoration(
              color: const Color(0xFFFF8D49),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(43),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
