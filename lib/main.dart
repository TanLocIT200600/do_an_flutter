import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Welcome/welcome.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/screens/mainScreen.dart';

import 'package:flutter_application_1/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: theme(),
      home: WelcomeScreen(),
    );
  }
}
