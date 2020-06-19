import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcomeflutter/utils/constants.dart';
import 'package:welcomeflutter/utils/navigators.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  List<Color> _colors = [Colors.orange, Colors.pink];
  List<double> _stops = [0.0, 0.9];
  SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');  //hide keyboard
    initPref();
    startTime();
  }

  void initPref() async {
     prefs = await SharedPreferences.getInstance();
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);                 //splash timer = 2
    return new Timer(_duration, navigationPage);
  }

  //navigate to screen based on user shared preference values......
  void navigationPage()async {
    bool isloggedin = prefs.getBool('isloggedin');
    if(isloggedin !=null && isloggedin ){
      Navigators.goToHome(context);
      //Keys.navKey.currentState.pushReplacementNamed(Routes.manTabScreen);    //if logged in -> move to home screen
    }else {
      Navigators.goToLogin(context);
      //Keys.navKey.currentState.pushReplacementNamed(Routes.getStartedScreen);      //if not, move to -> login screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: _colors,
                    stops: _stops,
                  )
              ),),
            /*Image(image: NetworkImage('https://i.pinimg.com/564x/53/5d/5a/535d5a3cb54b463057fc76c44ef56393.jpg'),
                  fit: BoxFit.fill,
                ),*/
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.all(60.0),
                        child: Image(
                            image: NetworkImage('https://flutter.dev/assets/flutter-lockup-c13da9c9303e26b8d5fc208d2a1fa20c1ef47eb021ecadf27046dea04c0cebf6.png'),
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 180.0),
                    ),
                    Text(
                      Constants.text,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: "Bal",
                          fontSize: 14.0,
                          color: Colors.black),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }


}
