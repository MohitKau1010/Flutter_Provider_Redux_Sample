import 'package:flutter/material.dart';
import 'package:welcomeflutter/utils/navigators.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            accountName: Text(
              "Mohit Kaushik",
            ),
            accountEmail: Text(
              "mohit@infostride.com",
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  'https://scontent-del1-1.xx.fbcdn.net/v/t1.0-9/95240835_3691097090965455_5920649517463502848_o.jpg?_nc_cat=100&_nc_sid=dd9801&_nc_ohc=TloDY4q6fK8AX9zt0jn&_nc_ht=scontent-del1-1.xx&oh=baa08a0f6a7580d01ba3991b6c4fed45&oe=5EFDC4A5'),
            ),
          ),
          new ListTile(
            onTap: (){
              ///Provider State screen
              Navigators.goToProviderState(context);
            },
            title: Text(
              "Provider State",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          new ListTile(
            title: Text(
              "Team",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
            ),
            leading: Icon(
              Icons.group,
              color: Colors.black,
            ),
          ),
          new ListTile(
            title: Text(
              "Chat",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
            ),
            leading: Icon(
              Icons.chat,
              color: Colors.black,
            ),
          ),
          new ListTile(
            title: Text(
              "Notifications",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
            ),
            leading: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
          new ListTile(
            title: Text(
              "Contacts",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
            ),
            leading: Icon(
              Icons.contacts,
              color: Colors.black,
            ),
          ),
          new ListTile(
            title: Text(
              "Messages",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
            ),
            leading: Icon(
              Icons.add_box,
              color: Colors.black,
            ),
          ),
          /*Divider(),*/
          new ListTile(
            title: Text(
              "More",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
            ),
            leading: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          new ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
          /*Divider(),*/
          //MyAboutTile()
        ],
      ),
    );
  }
}
