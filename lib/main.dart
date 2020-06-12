import 'package:flutter/material.dart';
import 'package:welcomeflutter/screens/auth_module/login_screen.dart';
import 'package:welcomeflutter/screens/auth_module/signup_screen.dart';
import 'package:welcomeflutter/screens/auth_module/splash_screen.dart';
import 'package:welcomeflutter/screens/state_mang/provider_state_managment/ExampleProviderState.dart';


var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
  "/signup": (BuildContext context) => SignupScreen(),
  "/provider": (BuildContext context) => EligiblityScreen(),
};

void main() => runApp(new MaterialApp(
    theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.black),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));

///for normal App SplashScreen()
///for Provider State Managment  EligiblityScreen()

