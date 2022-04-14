import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_application_1/screens/splash/splash_screen.dart';
// import 'package:flutter_application_1/screen/sign_in/sign_in_screen.dart';
// import 'package:flutter_application_1/screen/splash/components/splash_content.dart';
// import 'package:flutter_application_1/screen/splash/splash_screen.dart';

// we use name route
// all our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  
  HomeScreen.routeName: (context) => HomeScreen(),
};
