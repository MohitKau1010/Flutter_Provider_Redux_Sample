import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcomeflutter/utils/constants.dart';
import 'package:welcomeflutter/utils/navigators.dart';
import 'package:welcomeflutter/utils/validations.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<Color> _colors = [Colors.orange, Colors.pink];
  List<double> _stops = [0.0, 0.9];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _sharedPref(String name, String pass, bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool(Constants.is_logged_in, isLoggedIn);
      prefs.setString(Constants.user_name, name);
      prefs.setString(Constants.user_password, pass);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          body: Stack(fit: StackFit.expand, children: <Widget>[
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
                          'REGISTER',
                          style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontFamily: "Bal"),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name'
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
                      child: Text('Forgot Password',style: TextStyle(fontFamily: "Bal")),
                    ),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.black,
                          child: Text('Register',style: TextStyle(fontFamily: "Bal")),
                          onPressed: () {
                            //print(nameController.text);
                            //print(passwordController.text);
                            bool isValid =
                                Validations().isEmail(nameController.text);
                            if (isValid) {
                              _sharedPref(nameController.text,
                                  passwordController.text, false);
                              Navigators.goToLogin(context);
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Email is not valid',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white
                              );
                            }
                          },
                        )),
                    Container(
                        child: Row(
                      children: <Widget>[
                        Text('Does have account?',style: TextStyle(fontFamily: "Bal")),
                        FlatButton(
                          textColor: Colors.black,
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20,fontFamily: "Bal"),
                          ),
                          onPressed: () {
                            //signup screen
                            Navigators.goToLogin(context);
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                  ],
                ))
          ]),
        ));
  }

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
}
