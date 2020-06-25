import 'package:flutter/material.dart';
import 'package:flutterdemo/bed_room/bedroom_home_page.dart';
import 'package:flutterdemo/splashscreen.dart';
import 'Screens/SignInScreen.dart';
import 'Screens/SignUPScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Screen ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: 'SignIn',
      routes: {
        'SignIn':(context)=>SignInScreen(),
        'Bedroom':(context)=>BedroomPage(),
         'SignUp':(context)=>SignUpScreen(),
         'Home':(context)=>SplashScreen(),
      },
    );
  }
}
