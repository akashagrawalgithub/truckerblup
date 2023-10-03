import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trucker_email_login/screens/forget_password.dart';
import 'package:trucker_email_login/screens/home.dart';
import 'package:trucker_email_login/screens/register.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  bool isPasswordVisible = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    widget.emailController.addListener(updateButtonState);
    widget.passwordController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = widget.emailController.text.isNotEmpty &&
          widget.passwordController.text.isNotEmpty;
    });
  }

  void loginUser() async {
    setState(() {
      widget.isLoading = true;
    });
    if (widget.emailController.text.isEmpty ||
        widget.passwordController.text.isEmpty) {
      print("Please fill in all details");
      setState(() {
        widget.isLoading = false;
      });
    } else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: widget.emailController.text,
          password: widget.passwordController.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
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
              // height: 50,
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: widget.emailController,
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
                  errorStyle: TextStyle(height: 0.3),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              // height: 50,
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: widget.passwordController,
                obscureText: !widget.isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      widget.isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
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
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ForgetPassword(),
                    ));
                  },
                  child: const Text(
                    "Forget Password ?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF98A2B3),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
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
                onPressed: widget.isLoading ? null : loginUser,
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
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFFF2F4F7),
              ),
              child: TextButton(
                onPressed: () {
                  print("Back button pressed");
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
            const SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  "New to Truckerlink?, ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF475467),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterNow()),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      color: Color(0xFFFF8D49),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
