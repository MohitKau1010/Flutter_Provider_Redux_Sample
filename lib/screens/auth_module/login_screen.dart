import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcomeflutter/utils/constants.dart';
import 'package:welcomeflutter/utils/navigators.dart';
import 'package:welcomeflutter/utils/validations.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<Color> _colors = [Colors.orange, Colors.pink];
  List<double> _stops = [0.0, 0.9];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
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
                Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 110),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold,fontFamily: 'Bal'),
                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                fillColor: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(height: 60),
                        FlatButton(
                          onPressed: () {
                            //forgot password screen
                          },
                          textColor: Colors.black,
                          child: Text('Forgot Password',style: TextStyle(fontFamily: "Bal"),),
                        ),
                        Container(
                            height: 50,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.black,
                              child: Text('Login',style: TextStyle(fontFamily: "Bal")),
                              onPressed: () {
                                _loginOperations(nameController.text,
                                    passwordController.text);
                              },
                            )),
                        SizedBox(height: 20),
                        Container(
                            child: Row(
                              children: <Widget>[
                                Text('Does not have account?',style: TextStyle(fontFamily: "Bal"),),
                                FlatButton(
                                  textColor: Colors.black,
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(fontSize: 20,fontFamily: 'Bal'),
                                  ),
                                  onPressed: () {
                                    ///signup screen
                                    Navigators.goToSignup(this.context);
                                  },
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            )),
                      ],
                    )),
              ],
            )));
  }

  //region Backpressed
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        title: new Text('Are you sure?',style: TextStyle(fontFamily: "Bal"),),
        content: new Text('Do you want to exit an App',style: TextStyle(fontFamily: "Bal"),),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(this.context).pop(false),
            child: Text("NO",),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () => Navigator.of(this.context).pop(true),
            child: Text("YES"),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future<void> _loginOperations(String userName, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isValid = Validations().isEmail(userName);
    if (userName.length == 0||password.length == 0) {
      Fluttertoast.showToast(msg: 'enter your all fields',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white
      );
    }else{
      if (isValid) {
        ///here we check user is register.
        String user = prefs.getString(Constants.user_name);
        String pass = prefs.getString(Constants.user_password);
        if(userName==user||password==pass){
          ///set is logged in true.
          prefs.setBool(Constants.is_logged_in, true);
          Navigators.goToHome(context);
        }else{
          Fluttertoast.showToast(msg: 'Incorrect user / password',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              textColor: Colors.white
          );
        }
      }else{
        Fluttertoast.showToast(msg: 'You entered Wrong Email',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white
        );
      }
    }
  }
//endregion
}
