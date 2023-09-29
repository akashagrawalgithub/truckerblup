import "package:flutter/material.dart";

class SetnewPassword extends StatefulWidget {
  const SetnewPassword({super.key});

  @override
  State<SetnewPassword> createState() => _SetnewPasswordState();
}

class _SetnewPasswordState extends State<SetnewPassword> {
  bool _isPasswordVisible = false;
  TextEditingController forgetpasswordcontroller = TextEditingController();
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
                controller: forgetpasswordcontroller,
                keyboardType: TextInputType.text,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Create new password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  hintStyle: const TextStyle(
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
                  print("Forget Password continue clicked");
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
          ],
        ),
      ),
    );
  }
}
