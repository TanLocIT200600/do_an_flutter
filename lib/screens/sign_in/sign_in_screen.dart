import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
          // style: TextStyle(color: Color(0xFFD8D8D8), fontSize: 18)),
        ),
      ),
      body: Body(),
    );
  }
}
