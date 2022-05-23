import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Welcome/components/backgound.dart';
import 'package:flutter_application_1/screens/mainScreen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO NEWS APP",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/WelcomeLogo.png",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blueAccent,
                      Colors.redAccent,
                      Colors.purpleAccent
                    ]),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.57), blurRadius: 5)
                    ]),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onSurface: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 5),
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainScreen();
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 18,
                        bottom: 18,
                      ),
                      child: Text("Get Started"),
                    )))
          ],
        ),
      ),
    );
  }
}
