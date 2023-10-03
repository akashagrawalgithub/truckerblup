import 'dart:developer';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:trucker_email_login/screens/sample_page.dart';

class PopuiWidget extends StatefulWidget {
  const PopuiWidget({Key? key});

  @override
  State<PopuiWidget> createState() => _PopuiWidgetState();
}

class _PopuiWidgetState extends State<PopuiWidget> {
  final userMobilenumber = "8957792911";
  final _timeLeft = "10";
  final tipAmount = 30;
  final userEmailController = TextEditingController();
  CountryCode? selectedCountry;
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode phoneNumberFocus = FocusNode();
  @override
  void initState() {
    super.initState();
    selectedCountry = CountryCode.fromCountryCode("US");
    phoneNumberController.text = '';
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    phoneNumberFocus.dispose();
    super.dispose();
  }

  void _onCountryChange(CountryCode? countryCode) {
    setState(() {
      selectedCountry = countryCode;
      phoneNumberController.text = '';
    });
    FocusScope.of(context).requestFocus(phoneNumberFocus);
  }

  void OnDoneShowOTP() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            child: IntrinsicHeight(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter the 6-digit code sent to you at ${userMobilenumber}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF475467),
                            ),
                          ),
                          const SizedBox(height: 12),
                          IntrinsicWidth(
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 12, 16, 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(0xFFEAECF0),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    color: Color(0xFF475467),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text("Resend code(0.${_timeLeft})"),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              6,
                              (index) => Container(
                                width: 48.00,
                                height: 50.00,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF2F3F6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      if (index < 5) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // cancel and Done button
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Color(0xFFF2F3F6),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: TextButton(
                                onPressed: null,
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Color(0xFF98A1B2),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Color(0xFFEAECF0),
                            child: InkWell(
                              onTap: () {
                                log("Done Button pressed");
                              },
                              child: TextButton(
                                onPressed: null,
                                child: const Text(
                                  "Done",
                                  style: TextStyle(
                                    color: Color(0xFF475466),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: ElevatedButton(
                onPressed: null,
                child: const Text("Open OTP Bottom Sheet"),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    // isDismissible: false,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                          child: IntrinsicHeight(
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 300,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://www.team-bhp.com/forum/attachments/road-safety/1583654d1481355587-how-handle-prevent-tyre-burst-blowout-img_7863.jpg"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(16),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFFEAECF0),
                                          width: 0.9,
                                        ),
                                      ),
                                    ),
                                    child: const Text("sound option"),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const ListTile(
                                    leading: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.blue,
                                      child: Icon(
                                        Icons.person,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Text(
                                      "John Smith",
                                      style: TextStyle(
                                        color: Color(0xFF475466),
                                        fontSize: 18,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.warning_amber,
                                      size: 30,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 0, 16, 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8),
                                        const Text(
                                          "I need help for tyre puncture",
                                          style: TextStyle(
                                            color: Color(0xFF475466),
                                            fontSize: 20,
                                            fontFamily: 'SF Pro',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Text(
                                              "Help john smith and get ",
                                              style: TextStyle(
                                                color: Color(0xFF98A1B2),
                                                fontSize: 14,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              "\$${tipAmount.toString()}",
                                              style: const TextStyle(
                                                color: Color(0xFF344054),
                                                fontSize: 14,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          color: Color(0xFFF2F3F6),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              print("No button pressed");
                                            },
                                            child: TextButton(
                                              onPressed: null,
                                              child: const Text(
                                                "No",
                                                style: TextStyle(
                                                  color: Color(0xFF98A1B2),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Color(0xFFEAECF0),
                                          child: InkWell(
                                            onTap: () {
                                              print("YEs");
                                            },
                                            child: TextButton(
                                              onPressed: null,
                                              child: Text(
                                                "Yes",
                                                style: TextStyle(
                                                  color: Color(0xFF475466),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  "Someone needs help bottom navigation",
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    // isDismissible: false,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                            child: IntrinsicHeight(
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // user detils form
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Edit Profile",
                                            style: TextStyle(
                                              color: Color(0xFF475466),
                                              fontSize: 24,
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          const Text(
                                            "Profile photo",
                                            style: TextStyle(
                                              color: Color(0xFF98A1B2),
                                              fontSize: 14,
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            children: [
                                              const CircleAvatar(
                                                radius: 30,
                                                backgroundColor: Colors.blue,
                                                child: Icon(
                                                  Icons.person,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(width: 14),
                                              Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 2, 10, 2),
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFFF2F3F6),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                ),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                      const Color(0xFFF2F4F7),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    "Add Profile photo",
                                                    style: TextStyle(
                                                      color: Color(0xFF475466),
                                                      fontSize: 16,
                                                      fontFamily: 'SF Pro',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          // user name field
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Name",
                                                style: TextStyle(
                                                  color: Color(0xFF667084),
                                                  fontSize: 14,
                                                  fontFamily: 'SF Pro',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Container(
                                                width: double.infinity,
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                decoration: ShapeDecoration(
                                                  color:
                                                      const Color(0xFFF2F3F6),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                child: const TextField(
                                                  decoration: InputDecoration(
                                                    hintStyle: TextStyle(
                                                      color: Color(0xFF98A1B2),
                                                      fontSize: 16,
                                                      fontFamily: 'SF Pro',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    hintText: "Enter your Name",
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          // user name field
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Phone number",
                                                style: TextStyle(
                                                  color: Color(0xFF667084),
                                                  fontSize: 14,
                                                  fontFamily: 'SF Pro',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Row(
                                                children: [
                                                  IntrinsicWidth(
                                                    child: Container(
                                                      height: 48,
                                                      decoration:
                                                          ShapeDecoration(
                                                        color:
                                                            Color(0xFFF2F3F6),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child:
                                                            CountryCodePicker(
                                                          flagWidth: 40,
                                                          onChanged:
                                                              _onCountryChange,
                                                          onInit:
                                                              (countryCode) {
                                                            if (countryCode !=
                                                                null) {
                                                              selectedCountry =
                                                                  countryCode;
                                                            }
                                                          },
                                                          hideMainText: true,
                                                          initialSelection:
                                                              'US',
                                                          favorite: [
                                                            'IN',
                                                            'CA'
                                                          ],
                                                          showOnlyCountryWhenClosed:
                                                              false,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Expanded(
                                                    child: Container(
                                                      // width: double.infinity,
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16),
                                                      decoration:
                                                          ShapeDecoration(
                                                        color: const Color(
                                                            0xFFF2F3F6),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            phoneNumberController,
                                                        keyboardType:
                                                            TextInputType.phone,
                                                        decoration:
                                                            InputDecoration(
                                                          hintStyle:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF98A1B2),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'SF Pro',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          hintText:
                                                              "${selectedCountry?.dialCode} Enter your number",
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          // user Email field
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Email",
                                                style: TextStyle(
                                                  color: Color(0xFF667084),
                                                  fontSize: 14,
                                                  fontFamily: 'SF Pro',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Container(
                                                width: double.infinity,
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                decoration: ShapeDecoration(
                                                  color:
                                                      const Color(0xFFF2F3F6),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                child: TextField(
                                                  controller:
                                                      userEmailController,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintStyle: TextStyle(
                                                      color: Color(0xFF98A1B2),
                                                      fontSize: 16,
                                                      fontFamily: 'SF Pro',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    hintText:
                                                        "Enter your Email",
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            color: Color(0xFFF2F3F6),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const TextButton(
                                                onPressed: null,
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                    color: Color(0xFF98A1B2),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: Color(0xFFEAECF0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                OnDoneShowOTP();
                                              },
                                              child: const TextButton(
                                                onPressed: null,
                                                child: Text(
                                                  "Done",
                                                  style: TextStyle(
                                                    color: Color(0xFF475466),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                  // both button
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text("Fill user detail"),
              ),
            ),
            ListTile(
              trailing: PopupMenuButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    padding: const EdgeInsets.fromLTRB(12, 12, 40, 12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SamplePage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Mute notification",
                      style: TextStyle(
                        color: Color(0xFF475466),
                        fontSize: 16,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.fromLTRB(12, 12, 40, 12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SamplePage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Exit group",
                      style: TextStyle(
                        color: Color(0xFF475466),
                        fontSize: 16,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.fromLTRB(12, 12, 40, 12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SamplePage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Clear chat",
                      style: TextStyle(
                        color: Color(0xFF475466),
                        fontSize: 16,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // new group UI popup
            ListTile(
              trailing: PopupMenuButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    padding: EdgeInsets.fromLTRB(12, 12, 40, 12),
                    child: Text(
                      "New group",
                      style: TextStyle(
                        color: Color(0xFF475466),
                        fontSize: 16,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
