import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:trucker/screen/bottom_navigation/bottom.dart';
// import 'package:trucker/screen/login_screen/login_screen.dart';
// import 'package:trucker/screen/welcome_screen/welcome_screen.dart';

class Name extends StatefulWidget {
  // final String email;
  // final String phone;
  // const Name({Key? key, required this.email, required this.phone})
  //     : super(key: key);
  const Name({Key? key}) : super(key: key);
  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  // final user = FirebaseAuth.instance.currentUser!;
  bool isFirstNameValid = true;
  bool isLastNameValid = true;
  bool isEmailValid = true;
  bool isPhoneNumberValid = true;
  bool isButtonEnabled = false;
  // void signUserOut(BuildContext context) {
  //   GoogleSignIn().disconnect();
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => const Welcome()));
  // }

  bool areFieldsEmpty = false;

  @override
  void initState() {
    super.initState();
    // emailController.text = widget.email;
    emailController.addListener(updateButtonState);
    lastNameController.addListener(updateButtonState);
    emailController.addListener(updateButtonState);
    phoneController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          phoneController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void validateFields() {
    setState(() {
      areFieldsEmpty = firstNameController.text.isEmpty ||
          lastNameController.text.isEmpty ||
          emailController.text.isEmpty ||
          phoneController.text.isEmpty;
    });
  }

  bool isNameValid(String value) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(value) && value.isNotEmpty;
  }

  bool Emailvalid(String value) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: 354,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 67),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What\'s your name?',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  height: 32 / 24,
                  letterSpacing: 0,
                  color: Color(0xFF475467),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Please let us know the appropriate way to address you.',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF98A2B3),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'First name',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF475467),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: 361,
                    // height: 50,
                    padding: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      border: !isFirstNameValid
                          ? Border.all(color: Colors.red)
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF2F4F7),
                    ),
                    child: TextFormField(
                      controller: firstNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            !isNameValid(value)) {
                          return 'Please enter only letters in the first name.';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter First Name',
                        hintStyle: TextStyle(
                          color: Color(0xFF98A2B3),
                        ), // Hint text
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Last name',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      height: 1.43,
                      letterSpacing: 0.0,
                      color: Color(0xFF475467),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: 361,
                    // height: 50,
                    padding: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      border: !isLastNameValid
                          ? Border.all(color: Colors.red)
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF2F4F7),
                    ),
                    child: TextFormField(
                      controller: lastNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            !isNameValid(value)) {
                          return 'Please enter only letters in the second name.';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter Last Name',
                        hintStyle: TextStyle(
                          color: Color(0xFF98A2B3),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      height: 1.43,
                      letterSpacing: 0.0,
                      color: Color(0xFF475467),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    padding: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF2F4F7),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            !Emailvalid(value)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(
                          color: Color(0xFF98A2B3),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              if (!isEmailValid)
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Invalid email format',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Phone number',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      height: 1.43,
                      letterSpacing: 0.0,
                      color: Color(0xFF475467),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF2F4F7),
                    ),
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        hintText: 'Enter Phone number',
                        counterText: "",
                        hintStyle: TextStyle(
                          color: Color(0xFF98A2B3),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 6),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text('Email',style: TextStyle(
              //                       fontFamily: 'Inter',
              //                       fontSize: 14.0,
              //                       fontWeight: FontWeight.w500,
              //                       height: 1.43, // This corresponds to a line height of 20px (20 / 14)
              //                       letterSpacing: 0.0,
              //                       color: Color(0xFF475467),
              //                     )
              //         ,),
              //       const SizedBox(height: 10),
              //       Container(
              //         width: 361,
              //         height: 50,
              //         padding: const EdgeInsets.only(left: 16), // Adjust padding as needed
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: const Color(0xFFF2F4F7), // Background color
              //         ),
              //         child: TextFormField(
              //           controller: emailController,
              //           keyboardType: TextInputType.emailAddress,
              //           autovalidateMode: AutovalidateMode.onUserInteraction,
              //           validator: (input) => input!.validateEmail()
              //               ? null
              //               : "Please enter valid email!!",// Connect controller
              //           decoration: const InputDecoration(
              //             hintText: 'Email', // Hint text
              //             border: InputBorder.none, // Add borders if needed
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 6),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text('Phone number',style: TextStyle(
              //                       fontFamily: 'Inter',
              //                       fontSize: 14.0,
              //                       fontWeight: FontWeight.w500,
              //                       height: 1.43, // This corresponds to a line height of 20px (20 / 14)
              //                       letterSpacing: 0.0,
              //                       color: Color(0xFF475467),
              //                     )),
              //       const SizedBox(height: 10),
              //       Container(
              //         width: 361,
              //         height: 50,
              //         padding: const EdgeInsets.only(left: 16), // Adjust padding as needed
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: const Color(0xFFF2F4F7), // Background color
              //         ),
              //         child: TextField(
              //           controller: phoneController,
              //           keyboardType: TextInputType.phone,
              //           decoration: const InputDecoration(
              //             hintText: 'Phone number', // Hint text
              //             border: InputBorder.none, // Add borders if needed
              //           ),
              //         ),
              //       )
              //
              //     ],
              //   ),
              // ),

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
                  onPressed: () async {
                    // validateFields();
                    // if (!areFieldsEmpty) {
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (context) => const Bottom()));
                    // }
                  },
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: isButtonEnabled
                              ? Colors.white
                              : const Color(0xFF98A2B3)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 361,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFF2F4F7),
                ),
                child: TextButton(
                  onPressed: () async {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => const Login()));
                  },
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
