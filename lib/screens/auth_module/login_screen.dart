import 'dart:async';

import 'package:flutter/material.dart';
import 'package:welcomeflutter/utils/navigators.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                Image(image: NetworkImage('https://i.pinimg.com/564x/53/5d/5a/535d5a3cb54b463057fc76c44ef56393.jpg'),
                  fit: BoxFit.fill,
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 110),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Sign in',
                              style: TextStyle(fontSize: 20),
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
                            ),
                          ),
                        ),
                        SizedBox(height: 60),
                        FlatButton(
                          onPressed: () {
                            //forgot password screen
                          },
                          textColor: Colors.black,
                          child: Text('Forgot Password'),
                        ),
                        Container(
                            height: 50,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.black,
                              child: Text('Login'),
                              onPressed: () {
                                print(nameController.text);
                                print(passwordController.text);
                              },
                            )),
                        SizedBox(height: 20),
                        Container(
                            child: Row(
                              children: <Widget>[
                                Text('Does not have account?'),
                                FlatButton(
                                  textColor: Colors.black,
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(fontSize: 20),
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
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(this.context).pop(false),
                child: Text("NO"),
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
//endregion
}
