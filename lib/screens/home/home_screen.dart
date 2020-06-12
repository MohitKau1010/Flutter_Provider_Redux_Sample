import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:welcomeflutter/models/Data.dart';
import 'dart:convert';
import 'package:welcomeflutter/models/UserData.dart';
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
    for(var u in UserData.fromJson(json.decode(data.body)).data){
      Data user = Data(avatar: u.avatar,email: u.email,first_name: u.first_name,id: u.id,last_name: u.last_name);
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
                image: NetworkImage('https://www.uniquefbcovers.com/download/Clouds%20HD%20Fb%20Cover.jpg'),
              ),
              padding: EdgeInsets.all(0),
              decoration: new BoxDecoration(
                  color: Colors.black,
                  borderRadius: new BorderRadius.only(
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0))),
            ),
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
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  print(snapshot.data);
                  if(snapshot.data == null){
                    return Container(
                        child: Center(
                            child: Text("Loading...")
                        )
                    );
                  } else {
                    return SizedBox(
                      height: 600,
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data[index].avatar
                              ),
                            ),
                            title: Text(snapshot.data[index].first_name),
                            subtitle: Text(snapshot.data[index].email),
                            onTap: (){
                              Navigator.push(context,
                                  new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                              );
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
        title: Text("Home Screen"),
        actions: <Widget>[
          SizedBox(
            width: 5.0,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
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
        )
    );
  }
}

///User model
class User {
  final int id;
  final String first_name;
  final String last_name;
  final String email;
  final String avatar;

  ///user constructure
  User(this.id, this.first_name, this.last_name, this.email, this.avatar);
}
