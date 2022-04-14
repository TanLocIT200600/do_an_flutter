import 'package:flutter/material.dart';
import 'package:flutter_application_1/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            "Welcome Back",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(28),
            ),
          ),
        ],
      ),
    );
  }
}
