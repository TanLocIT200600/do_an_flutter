import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/menuScreen.dart';
import 'package:flutter_application_1/shared/bottomNavigation.dart';
import 'package:flutter_application_1/styles/theme.dart' as Style;

import '../components/tabs/homeScreen.dart';
import '../components/tabs/searchScreen.dart';
import '../components/tabs/sourceScreen.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _child;
  BottomNavigation _bottomNavigation;
  @override
  void initState() {
    super.initState();
    _bottomNavigation = BottomNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 233, 111, 255),
            Color.fromARGB(255, 255, 212, 83),
            Color.fromARGB(255, 255, 223, 80),
          ])),
      child: Scaffold(
        // backgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'News App',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 233, 111, 255),
                  Color.fromARGB(255, 255, 212, 83),
                  Color.fromARGB(255, 255, 223, 80),
                ],
              ),
            ),
          ),
        ),
        extendBody: true,
        body: _child,
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
                icon: Icons.home,
                backgroundColor: Colors.pink,
                extras: {"label": "home"}),
            FluidNavBarIcon(
                icon: Icons.grid_on_outlined,
                backgroundColor: Colors.pink,
                extras: {"label": "category"}),
            FluidNavBarIcon(
                icon: Icons.search,
                backgroundColor: Colors.pink,
                extras: {"label": "search"}),
            FluidNavBarIcon(
                icon: Icons.menu,
                backgroundColor: Colors.pink,
                extras: {"label": "menu"}),
          ],
          onChange: _handleNavigationChange,
          style: FluidNavBarStyle(
              iconSelectedForegroundColor: Colors.white,
              iconUnselectedForegroundColor: Colors.white60),
          scaleFactor: 1.5,
          defaultIndex: 0,
          itemBuilder: (icon, item) => Semantics(
            label: icon.extras["label"],
            child: item,
          ),
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeScreen();
          break;
        case 1:
          _child = SourceScreen();
          break;
        case 2:
          _child = SearchScreen();
          break;
        case 3:
          _child = MenuScreen();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }

  Widget testScreen() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Text("Test Screen")],
      ),
    );
  }
}
