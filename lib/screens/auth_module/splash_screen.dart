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
            child: Image(
              fit: BoxFit.fill,
                image: NetworkImage(
                    'https://i.pinimg.com/564x/53/5d/5a/535d5a3cb54b463057fc76c44ef56393.jpg') //Fetch Image From NetworkURL
                ),
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
                      CircleAvatar(
                          backgroundImage: new NetworkImage('https://scontent-del1-1.xx.fbcdn.net/v/t1.0-9/95240835_3691097090965455_5920649517463502848_o.jpg?_nc_cat=100&_nc_sid=dd9801&_nc_ohc=TloDY4q6fK8AX9zt0jn&_nc_ht=scontent-del1-1.xx&oh=baa08a0f6a7580d01ba3991b6c4fed45&oe=5EFDC4A5'),
                          radius: 50.0,
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
                      Constants.text, //"World's No. 1 Brand",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
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
