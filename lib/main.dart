import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:welcomeflutter/screens/auth_module/login_screen.dart';
import 'package:welcomeflutter/screens/auth_module/signup_screen.dart';
import 'package:welcomeflutter/screens/auth_module/splash_screen.dart';
import 'package:welcomeflutter/screens/state_mang/provider_state_managment/ExampleProviderState.dart';
import 'package:welcomeflutter/screens/state_mang/redux/UI/redux.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/UI/redux_thunk.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/store.dart';


var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
  "/signup": (BuildContext context) => SignupScreen(),
  "/provider": (BuildContext context) => EligiblityScreen(),
  "/redux": (BuildContext context) => Settings(),
  "/redux_thunk": (BuildContext context) => ReduxThunk(),
};

void main() {
  runApp(new MaterialApp(
    title: "Welcome Flutter",
      theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes));
}

