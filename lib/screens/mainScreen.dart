import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/menuScreen.dart';
import 'package:flutter_application_1/shared/bottomNavigation.dart';
import 'package:flutter_application_1/styles/theme.dart' as Style;

import '../components/tabs/homeScreen.dart';
import '../components/tabs/searchScreen.dart';
import '../components/tabs/sourceScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  BottomNavigation _bottomNavigation;
  @override
  void initState() {
    super.initState();
    _bottomNavigation = BottomNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Style.Colors.mainColor,
          title: Text(
            "News App",
            style: TextStyle(color: Color.fromARGB(255, 40, 40, 40)),
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<NavBarItem>(
          stream: _bottomNavigation.itemStream,
          initialData: _bottomNavigation.defaultItem,
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            switch (snapshot.data) {
              case NavBarItem.HOME:
                return HomeScreen();
              case NavBarItem.SOURCES:
                return SourceScreen();
              case NavBarItem.SEARCH:
                return SearchScreen();
              case NavBarItem.MENU:
                return MenuScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavigation.itemStream,
        initialData: _bottomNavigation.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[100], spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                iconSize: 24,
                unselectedItemColor: Style.Colors.grey,
                unselectedFontSize: 12,
                selectedFontSize: 12,
                type: BottomNavigationBarType.fixed,
                fixedColor: Style.Colors.mainsColor,
                currentIndex: snapshot.data.index,
                onTap: _bottomNavigation.pickItem,
                items: [
                  BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(EvaIcons.homeOutline),
                    activeIcon: Icon(EvaIcons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "Sources",
                    icon: Icon(EvaIcons.gridOutline),
                    activeIcon: Icon(EvaIcons.grid),
                  ),
                  BottomNavigationBarItem(
                    label: "Search",
                    icon: Icon(EvaIcons.searchOutline),
                    activeIcon: Icon(EvaIcons.search),
                  ),
                  BottomNavigationBarItem(
                    label: "Menu",
                    icon: Icon(EvaIcons.menu),
                    activeIcon: Icon(EvaIcons.menu),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
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
