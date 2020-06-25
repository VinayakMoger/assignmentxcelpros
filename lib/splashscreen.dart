import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterdemo/bed_room/bedroom_home_page.dart';

import 'Screens/SignInScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  startTime() async {

    var _duration = new Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>  BedroomPage(),
      ),
    );
  }


  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Sign.png")
              )
            ),
          )
        ],
      )/*Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          Center(
            child: Container(
              child: Image.asset("assets/Sign.png")
            ),
          ),
          CircularProgressIndicator(),
          SizedBox(
            height: 40,
          )
        ],
      )*/,
    );
  }
}
