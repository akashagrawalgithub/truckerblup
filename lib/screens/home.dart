import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:trucker_email_login/screens/login.dart";

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("User logged in using: ${user?.email ?? 'N/A'}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signOut,
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
