import 'package:flutter/material.dart';
import 'package:welcomeflutter/screens/auth_module/login_screen.dart';
import 'package:welcomeflutter/screens/auth_module/signup_screen.dart';
import 'package:welcomeflutter/screens/auth_module/splash_screen.dart';
import 'package:welcomeflutter/screens/notes/notes.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/ui/bloc_screen.dart';
import 'package:welcomeflutter/screens/state_mang/provider_state_managment/ExampleProviderState.dart';
import 'package:welcomeflutter/screens/state_mang/redux/UI/redux.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/UI/redux_thunk.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
  "/signup": (BuildContext context) => SignupScreen(),
  "/provider": (BuildContext context) => ProviderState(),
  "/redux": (BuildContext context) => Redux(), //Settings  //Redux
  "/redux_thunk": (BuildContext context) => ReduxThunk(),
  "/note": (BuildContext context) => NoteList(),
  "/bloc": (BuildContext context) => Bloc(),
};

void main() {
  runApp(new MaterialApp(
      title: "Welcome Flutter",
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes));
}
