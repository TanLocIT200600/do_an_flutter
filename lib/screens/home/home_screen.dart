import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_navbar_bottom.dart';
import 'package:flutter_application_1/enums.dart';
import 'package:flutter_application_1/screens/home/components/body.dart';
import '../../components/custom_navbar_bottom.dart';
import '../../widgets/headline_slider.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return HeadlingSliderWidget(
        // children: [
        // HeadlingSliderWidget(),
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Row(
        //     children: <Widget>[
        //       Text(
        //         "Top channels",
        //         style: TextStyle(
        //             color: Colors.black,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 17.0),
        //       ),
        //     ],
        //   ),
        // ),
        // // TopChannelsWidget(),
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Row(
        //     children: <Widget>[
        //       Text(
        //         "Hot news",
        //         style: TextStyle(
        //             color: Colors.black,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 17.0),
        //       ),
        //     ],
        //   ),
        // ),
        // HotNewsWidget()
        // ],
        );
  }
}
