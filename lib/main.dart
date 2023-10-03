import "package:flutter/material.dart";
import 'package:trucker_email_login/comunication_module/chart.dart';
import 'package:trucker_email_login/screens/Name_sir.dart';
import 'package:trucker_email_login/screens/Search.dart';
import 'package:trucker_email_login/screens/email_otp.dart';
import "package:trucker_email_login/screens/login.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:trucker_email_login/screens/login_temp.dart';
import 'package:trucker_email_login/screens/popui_widget.dart';
import 'package:trucker_email_login/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginPage(),
        // body: VerifyOTP(),
        // body: Name(),
        // body: PopuiWidget(),
        // body: MoreItemDragMenu(),
        // body: Login(),
        // body: Chat(),
        // body: CommunicationGroupsMute(),
      ),
    );
  }
}
