import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/category/category_screen.dart';
import '../screens/favorite/favorite_screen.dart';
import '../screens/menu/menu_screen.dart';

class CustomBottomNavigation extends StatefulWidget {
  static const routeName = "bottom-layout";
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int selectedIndex = 0;

  Widget _homeScreen = MyHome();
  Widget _categoryScreen = CategoryScreen();
  Widget _myEmails = FavoriteScreen();
  Widget _myProfile = MenuScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNavigationBar Example"),
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(234, 238, 238, 238),
        onTap: (index) {
          onTapHandler(index);
        },
        selectedIconTheme: IconThemeData(
          color: Color.fromRGBO(251, 144, 58, 1),
          opacity: 1.0,
          size: 45,
        ),
        selectedItemColor: Colors.amber[800],
        unselectedIconTheme:
            IconThemeData(color: Colors.black45, opacity: 0.5, size: 25),
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.window_outlined), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }

  Widget getBody() {
    if (selectedIndex == 0) {
      return _homeScreen;
    } else if (selectedIndex == 1) {
      return _categoryScreen;
    } else if (selectedIndex == 2) {
      return _myEmails;
    } else {
      return _myProfile;
    }
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
