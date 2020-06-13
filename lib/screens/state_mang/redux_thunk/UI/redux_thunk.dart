
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/artical/actions.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/model/artical.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/store.dart';

class ReduxThunk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Redux.init();

    return MaterialApp(
      title: 'Redux',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.black),
      home: StoreProvider<AppState>(
        store: Redux.store,
        child: MyHomePage(title: 'Redux Thunk'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _onFetchPostsPressed() {
    Redux.store.dispatch(fetchPostsAction); ///actions
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Fetch Posts"),
            onPressed: _onFetchPostsPressed,
          ),
          StoreConnector<AppState, bool>(
            distinct: true,
            converter: (store) => store.state.postsState.isLoading,
            builder: (context, isLoading) {
              if (isLoading) {
                return CircularProgressIndicator();
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          StoreConnector<AppState, bool>(
            distinct: true,
            converter: (store) => store.state.postsState.isError,
            builder: (context, isError) {
              if (isError) {
                return Text("Failed to get posts");
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          Expanded(
            child: StoreConnector<AppState, List<Artical>>(
              distinct: true,
              converter: (store) => store.state.postsState.artical,
              builder: (context, posts) {
                return ListView(
                  children: _buildPosts(posts),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPosts(List<Artical> posts) {
    return posts
        .map(
          (post) => ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),
        key: Key(post.id.toString()),
      ),
    )
        .toList();
  }
}
