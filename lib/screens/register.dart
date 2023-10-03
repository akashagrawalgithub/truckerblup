import "dart:developer";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:trucker_email_login/screens/home.dart";

// ignore: must_be_immutable
class RegisterNow extends StatefulWidget {
  RegisterNow({super.key});
  bool isPasswordVisible = false;
  final registeremailcontroller = TextEditingController();
  final registerpasswordcontroller = TextEditingController();
  bool isLoading = false;
  @override
  State<RegisterNow> createState() => _RegisterNowState();
}

class _RegisterNowState extends State<RegisterNow> {
  bool isButtonEnabled = false;
  @override
  void initState() {
    super.initState();
    widget.registeremailcontroller.addListener(updateButtonState);
    widget.registerpasswordcontroller.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = widget.registeremailcontroller.text.isNotEmpty &&
          widget.registerpasswordcontroller.text.isNotEmpty;
    });
  }

  void createUser() async {
    setState(() {
      widget.isLoading = true;
    });
    if (widget.registeremailcontroller.text.isEmpty ||
        widget.registerpasswordcontroller.text.isEmpty) {
      log("Please filed all details");
      setState(() {
        widget.isLoading = false;
      });
    } else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: widget.registeremailcontroller.text,
          password: widget.registerpasswordcontroller.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } on FirebaseAuthException catch (e) {
        log(e.code);
      } finally {
        setState(() {
          widget.isLoading = false;
        });
      }
    }
  }

  bool Emailvalid(String value) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value);
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
              "Enter your Email",
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
              child: TextFormField(
                controller: widget.registeremailcontroller,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.isNotEmpty && !Emailvalid(value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter Your Email",
                  hintStyle: TextStyle(
                    color: Color(0xFF98A2B3),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // password container
            Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: widget.registerpasswordcontroller,
                keyboardType: TextInputType.text,
                obscureText: !widget.isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      widget.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xFFFF8D49),
                    ),
                    onPressed: () {
                      setState(() {
                        widget.isPasswordVisible = !widget.isPasswordVisible;
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
              height: 18,
            ),
            // continue button
            Container(
              width: 361,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isButtonEnabled
                    ? const Color(0xFFFF8D49)
                    : const Color(0xFFF9FAFB),
              ),
              child: TextButton(
                onPressed: widget.isLoading ? null : createUser,
                child: Center(
                  child: widget.isLoading
                      ? Container(
                          width: 20,
                          height: 20,
                          child: const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: isButtonEnabled
                                ? Colors.white
                                : const Color(0xFF98A2B3),
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            // back button
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
