import 'package:flutter/material.dart';
import 'package:welcomeflutter/screens/home/home_screen.dart';
import 'package:welcomeflutter/screens/auth_module/login_screen.dart';
import 'package:welcomeflutter/screens/auth_module/signup_screen.dart';

class Navigators {
  static void goToHome(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    //Navigator.pushNamed(context, "/login");
  }

  static void goToLogin(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    //Navigator.pushNamed(context, "/login");
  }

  static void goToSignup(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SignupScreen()));
    //Navigator.pushNamed(context, "/signup");
  }
  ///EligiblityScreen
  static void goToProviderState(BuildContext context) {
    /*Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => EligiblityScreen()));*/
    Navigator.pushNamed(context, "/provider");
  }

  ///Redux
  static void goToRedux(BuildContext context) {
    /*Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => EligiblityScreen()));*/
    Navigator.pushNamed(context, "/redux");
  }

  ///Redux Thunk
  static void goToReduxThunk(BuildContext context) {
    /*Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => EligiblityScreen()));*/
    Navigator.pushNamed(context, "/redux_thunk");
  }
}
