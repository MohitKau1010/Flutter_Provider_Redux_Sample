import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:welcomeflutter/screens/state_mang/redux/state/actions.dart';
import 'package:welcomeflutter/screens/state_mang/redux/state/app_state.dart';
import 'package:welcomeflutter/screens/state_mang/redux/state/reducer.dart';
import 'package:welcomeflutter/utils/constants.dart';

///void main() {
//  final _initialState = AppState(sliderFontSize: 0.5);
//  final Store<AppState> _store =
//      Store<AppState>(reducer, initialState: _initialState);
//
//  runApp(MyApp(store: _store));
//}
//
//class MyApp extends StatelessWidget {
//  final Store<AppState> store;
//
//  MyApp({this.store});
//
//  @override
//  Widget build(BuildContext context) {
//    return StoreProvider<AppState>(
//      store: store,
//      child: MaterialApp(
//        initialRoute: '/',
//        routes: {
//          '/': (context) => Home(),
//          '/about': (context) => About(),
//          '/settings': (context) => Settings(),
//        },
//      ),
//    );
//  }
//}

//class ReduxThunk extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Redux',
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.black),
//      home: StoreProvider<AppState>(
//        store: Redux.store,
//        child: MyHomePage(title: 'Redux Thunk'),
//      ),
//    );
//  }
//}

class Redux extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _initialState = AppState(sliderFontSize: 0.20);
    final Store<AppState> _store = Store<AppState>(reducer, initialState: _initialState);

    return MaterialApp(
      title: 'Redux',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.black),
      home: StoreProvider<AppState>(
        store: _store,
        child: Settings(title: 'Redux Thunk'),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  Settings({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Redux'),
              actions: <Widget>[
                SizedBox(
                  width: 5.0,
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return StoreConnector<AppState, AppState>(
                            converter: (store) => store.state,
                            builder: (context, state) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20.0)), //this right here
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 20, top: 20),
                                      child: Text(
                                        'Font Size: ${state.viewFontSize.toInt()}',
                                        style: TextStyle(
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .headline
                                                .fontSize),
                                      ),
                                    ),
                                    Slider(
                                        min: 0.5,
                                        value: state.sliderFontSize,
                                        onChanged: (newValue) {
                                          StoreProvider.of<AppState>(context)
                                              .dispatch(FontSize(newValue));
                                        }),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 8),
                                      child: Row(
                                        children: <Widget>[
                                          Checkbox(
                                              value: state.bold,
                                              onChanged: (newValue) {
                                                try {
                                                  StoreProvider.of<AppState>(
                                                      context)
                                                      .dispatch(Bold(newValue));
                                                } catch (e) {
                                                  print(e);
                                                }
                                              }),
                                          Text(
                                            'Bold',
                                            style:
                                            getStyle(state.bold, false),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 8),
                                      child: Row(
                                        children: <Widget>[
                                          Checkbox(
                                              value: state.italic,
                                              onChanged: (newValue) {
                                                StoreProvider.of<AppState>(context)
                                                    .dispatch(Italic(newValue));
                                              }),
                                          Text(
                                            'Italic',
                                            style:
                                            getStyle(false, state.italic),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        });
                  },
                  icon: Icon(Icons.more_vert),
                ),
              ],
            ),
            /*drawer: DrawerMenu(),*/
            body: Container(
              margin: EdgeInsets.all(10),
              child: RichText(
                text: TextSpan(
                  text: Constants.largeText,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          );
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }

}
