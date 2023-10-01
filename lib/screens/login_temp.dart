import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:trucker/screen/login_screen/name_screen.dart';
// import 'package:trucker/screen/login_screen/otp_screen.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   Future<String?> signInWithGoogle(BuildContext context) async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//       await googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );
//         final UserCredential authResult =
//         await _auth.signInWithCredential(credential);
//         final User? user = authResult.user;
//         if (user != null) {
//           return user.email;
//         }
//       }
//     } catch (error) {
//       // Handle errors here
//       print(error.toString());
//     }
//     return null;
//   }
// }

class Login extends StatefulWidget {
  Login({super.key});
  bool isLoading = false;
  static String verify = "";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController countryController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  var phonex = "";
  Color gray300 = Colors.grey.withOpacity(0.3);
  CountryCode? selectedCountry;
  bool isButtonEnabled = false;
  @override
  void initState() {
    super.initState();
    selectedCountry = CountryCode.fromCountryCode("US");
    phoneNumberController.text = '';
    phoneNumberController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = phoneNumberController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    phoneNumberController.dispose();

    super.dispose();
  }

  void _onCountryChange(CountryCode? countryCode) {
    setState(() {
      selectedCountry = countryCode;
      phoneNumberController.text = '';
    });
  }

  void verify(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        Login.verify = verificationId;
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => Otp(phoneNumber: phoneNumber),
        //   ),
        // );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void _handleGetPhone() async {
    if (phonex.isEmpty) {
      return;
    }

    setState(() {
      widget.isLoading = true;
    });

    final phoneNumber = phonex;
    verify(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 361,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Enter your mobile number',
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF475467),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        // IntlPhoneField(
                        //   decoration: const InputDecoration(
                        //     labelText: 'Enter Your Number',
                        //     border: OutlineInputBorder(
                        //       borderSide: BorderSide(),
                        //     ),
                        //   ),
                        //   languageCode: "en",
                        //   onChanged: (phone) {
                        //     phonex = phone.completeNumber;
                        //   },
                        // ),
                        Row(
                          children: [
                            IntrinsicWidth(
                              child: Container(
                                height: 48,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF2F3F6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: CountryCodePicker(
                                    flagWidth: 40,
                                    onChanged: _onCountryChange,
                                    onInit: (countryCode) {
                                      if (countryCode != null) {
                                        selectedCountry = countryCode;
                                      }
                                    },
                                    hideMainText: true,
                                    initialSelection: 'US',
                                    favorite: ['IN', 'CA'],
                                    showOnlyCountryWhenClosed: false,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                // width: double.infinity,
                                padding: const EdgeInsets.only(left: 16),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF2F3F6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: TextField(
                                  controller: phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                      color: Color(0xFF98A1B2),
                                      fontSize: 16,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    hintText:
                                        "${selectedCountry?.dialCode} Enter your number",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
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
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            )),
                            onPressed: phonex.isEmpty && widget.isLoading
                                ? null
                                : _handleGetPhone,
                            child: Center(
                              child: widget.isLoading
                                  ? Container(
                                      width: 20,
                                      height: 20,
                                      child: const CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    )
                                  : Center(
                                      child: Text(
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: 361,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFD0D5DD), width: 1),
                      color: const Color(0xFFD0D5DD), // Background color
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: 361,
                    height: 112,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 361,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFFf2f4f7),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                )),
                                onPressed: () async {
                                  // String? googleEmail = await AuthService()
                                  //     .signInWithGoogle(context);
                                  // if (googleEmail != null) {
                                  //   Navigator.of(context).push(MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           Name(email: googleEmail, phone: '')));
                                  // } else {
                                  //   print("NULL");
                                  // }
                                },
                                child: Row(
                                  children: [
                                    // SvgPicture.asset(
                                    //   'assets/image/google.svg', // Replace with your image path
                                    //   width: 30, // Image width
                                    //   height: 30, // Image height
                                    //   fit: BoxFit
                                    //       .cover, // Adjust the fit as needed
                                    // ),
                                    const SizedBox(
                                        width:
                                            16), // Reduce the gap between image and text
                                    const Expanded(
                                      child: Text(
                                        'Continue with Google',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF475467),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: 361, // Fixed width in logical pixels
                              height: 50, // Fixed height in logical pixels
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFFF2F4F7), // Background color
                                borderRadius: BorderRadius.circular(
                                    12), // Rounded corners
                              ),
                              child: TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                )),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    // SvgPicture.asset(
                                    //   'assets/image/email.svg', // Replace with your image path
                                    //   width: 25, // Image width
                                    //   height: 25, // Image height
                                    //   fit: BoxFit
                                    //       .cover, // Adjust the fit as needed
                                    // ),
                                    const SizedBox(
                                        width:
                                            16), // Reduce the gap between image and text
                                    const Expanded(
                                      child: Text(
                                        'Continue with Email',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0,
                                          color: Color(0xFF475467),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ), // Gap
                  Container(
                    width: 361,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xFFD0D5DD),
                          width: 1), // Border with color and width
                      color: const Color(0xFFD0D5DD), // Background color
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: 361,
                    height: 312,
                    child: Column(
                      children: [
                        const Text(
                          'Upon entering your number, TruckerLink will send an SMS or OTP to your mobile number',
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontSize: 12,
                            fontWeight:
                                FontWeight.w500, // Use a valid FontWeight value
                            color: Color(0xFF98A2B3),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'We value your privacy by clicking the Continue, you agree to our terms and privacy policy',
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontSize: 12,
                            fontWeight:
                                FontWeight.w500, // Use a valid FontWeight value
                            color: Color(0xFF98A2B3),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 160,
                            height: 48,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(43),
                              color: const Color(0xFFEAECF0),
                              // Background color
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // SvgPicture.asset(
                                //   'assets/image/question.svg',
                                //   width: 20,
                                //   height: 20,
                                //   fit: BoxFit.scaleDown,
                                // ),
                                // SizedBox(width:3),
                                const Text(
                                  'Need Help?',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF475467),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
