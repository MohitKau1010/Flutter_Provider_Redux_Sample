import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcomeflutter/models/Data.dart';
import 'package:welcomeflutter/models/UserData.dart';
import 'package:welcomeflutter/utils/constants.dart';
import 'package:welcomeflutter/widgets/common_drawer.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  ///hit api
  Future<List<Data>> _getUsers() async {
    var data = await http.get("https://reqres.in/api/users?page=2");
    //Map<String, dynamic> jsonDataObject = jsonDecode(data.body);
    //var name = jsonDataObject['data']['name'];

    //var jsonData = json.decode(jsonDataObject['data']);
    UserData.fromJson(json.decode(data.body));
    List<Data> dataItem = [];
    for (var u in UserData.fromJson(json.decode(data.body)).data) {
      Data user = Data(
          avatar: u.avatar,
          email: u.email,
          first_name: u.first_name,
          id: u.id,
          last_name: u.last_name);
      dataItem.add(user);
    }
    print(dataItem.length);
    return dataItem;
  }

  ///static list
  final List<String> entries = <String>[
    'https://bootdey.com/img/Content/avatar/avatar7.png',
    'https://bootdey.com/img/Content/avatar/avatar7.png',
    'https://bootdey.com/img/Content/avatar/avatar7.png',
    'https://bootdey.com/img/Content/avatar/avatar7.png',
    'https://bootdey.com/img/Content/avatar/avatar7.png',
    'https://bootdey.com/img/Content/avatar/avatar7.png',
    'https://bootdey.com/img/Content/avatar/avatar7.png',
    'https://bootdey.com/img/Content/avatar/avatar7.png',
    'https://bootdey.com/img/Content/avatar/avatar7.png',
    'https://bootdey.com/img/Content/avatar/avatar7.png'
  ];

  ///static list for background color
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    400,
    200,
    300
  ];

  //Column1

  //region BodyData
  Widget _bodyData() {
    return Padding(
        padding: EdgeInsets.all(0),
        child: ListView(
          children: <Widget>[
            /*SizedBox(height: 170),*/
            Container(
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://www.uniquefbcovers.com/download/Clouds%20HD%20Fb%20Cover.jpg'),
              ),
              padding: EdgeInsets.all(0),
              decoration: new BoxDecoration(
                  color: Colors.black,
                  borderRadius: new BorderRadius.only(
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0))),
            ),
            ///static list implemented
            /*SizedBox(height: 0),
            Container(
                height: 50,
                decoration: new BoxDecoration(color: Colors.black),
                child: ListView.builder(
                    padding: const EdgeInsets.all(4),
                    itemCount: entries.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 25,
                        width: 50,
                        color: Colors.amber[colorCodes[index]],
                        child: Center(
                            child: Image(
                          image: NetworkImage('${entries[index]}'),
                        )),
                      );
                    })),
            SizedBox(height: 10),*/
            Container(
              child: FutureBuilder(
                future: _getUsers(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(snapshot.data);
                  if (snapshot.data == null) {
                    return Container(child: Center(child: Text("Loading...")));
                  } else {
                    return SizedBox(
                      height: 600,
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(snapshot.data[index].avatar),
                            ),
                            title: Text(snapshot.data[index].first_name,style: TextStyle(fontFamily: "Bal"),),
                            subtitle: Text(snapshot.data[index].email,style: TextStyle(fontFamily: "Bal"),),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(snapshot.data[index])));
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }

  //endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("Home Screen",style: TextStyle(fontFamily: "Bal")),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _choiceAction(Constants.SignOut,context),
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      drawer: true ? HomeDrawer() : null,
      body: _bodyData(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add),
        tooltip: "Add Items",
        onPressed: () {
          //_openCustomDialog(context);
        },
      ),
    );
  }

   _choiceAction(String choice,BuildContext context) {

    if (choice == Constants.Settings) {
      print('Settings');
    } else if (choice == Constants.Subscribe) {
      print('Subscribe');
    } else if (choice == Constants.SignOut) {
      print('SignOut');
      /// context not found "how to find cotext here"
      //Navigator.of(context).pop(true);
      _signoutUser();
    }
  }

  Future<void> _signoutUser() async {
    ///alert dialog
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Constants.is_logged_in, false);
  }
}

///Detail page from list
class DetailPage extends StatelessWidget {
  final Data user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(user.first_name),
      backgroundColor: Colors.black,
    ));
  }
}

///User model
class User {
  final int id;
  final String lastName;
  final String firstName;
  final String email;
  final String avatar;

  ///user constructure
  User(this.id, this.firstName, this.lastName, this.email, this.avatar);
}
