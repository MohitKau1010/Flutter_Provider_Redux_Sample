import 'package:flutter/material.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/blocs/bloc.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/models/getList.dart';

class Bloc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BlocState();
  }
}

class BlocState extends State<Bloc> {
  @override
  void initState() {
    super.initState();
    ///fetching data from api
    bloc.fetchAllUsers();
  }

  @override
  void dispose() async {
    ///release bloc
    await bloc.AllUsers.drain();
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Screen'),
      ),
      body: StreamBuilder(
        stream: bloc.AllUsers,
        builder: (context, AsyncSnapshot<GetList> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);

            /// if all right then show list
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());

            /// show error massage
          }
          return Center(
              child:
                  CircularProgressIndicator()); //Text(snapshot.error.toString());//
          /// else show loading..
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<GetList> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.data.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                "${snapshot.data.data[index].avatar}",
                fit: BoxFit.cover,
              ),
              onTap: () {},
            ),
          );
        });
  }
}
