import 'dart:async';

import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadsharedpref();
  }

  _loadsharedpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if(prefs.getBool('isloggedin')??false){
        Timer(Duration(seconds: 3), () => Navigators.goToHome(context));
      }else{
        Timer(Duration(seconds: 3), () => Navigators.goToLogin(context));
      }//splash timer for 3 secounds
    });
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
                      Image(
                          image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.iconfinder.com%2Ficons%2F4691465%2Fflutter_icon&psig=AOvVaw1h89C75DR1n5XwUNEA1DSl&ust=1592338008299000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDx7rzPhOoCFQAAAAAdAAAAABAI'),
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
