import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:welcomeflutter/screens/state_mang/redux/state/AppState.dart';
import 'package:welcomeflutter/screens/state_mang/redux/state/actions.dart';
import 'package:welcomeflutter/screens/state_mang/redux/state/reducer.dart';
import 'package:welcomeflutter/utils/constants.dart';

class Redux extends StatelessWidget {
  final _initialState = RAppState(sliderFontSize: 0.20);

  @override
  Widget build(BuildContext context) {
    final Store<RAppState> _store =
        Store<RAppState>(reducer, initialState: _initialState);

    return StoreProvider<RAppState>(
      store: _store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Settings(),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RAppState, RAppState>(
      converter: (store) => store.state,
      builder: (BuildContext context, RAppState state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Redux setting'),
            actions: <Widget>[
              SizedBox(
                width: 5.0,
              ),
              IconButton(
                onPressed: () {
                  ///dialogShow();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
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
                                  min: 0,
                                  max: 1,
                                  value: state.sliderFontSize,
                                  onChanged: (newValue) {
                                    /*StoreProvider.of<RAppState>(context)
                                        .dispatch(FontSize(newValue));*/
                                  }),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: state.bold,
                                        onChanged: (newValue) {
                                          try {
                                            StoreProvider.of<RAppState>(context).dispatch(Bold(newValue));
                                            /*StoreProvider.of<AppState>(context)
                                                .dispatch(Bold(newValue));*/
                                          } catch (e) {
                                            print(e);
                                          }
                                        }),
                                    Text(
                                      'Bold',
                                      style: getStyle(state.bold, false),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: state.italic, //
                                        onChanged: (newValue) {
                                          StoreProvider.of<RAppState>(context)
                                              .dispatch(Italic(newValue));
                                        }),
                                    Text(
                                      'Italic',
                                      style: getStyle(false, state.italic),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
      },
    );
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }

  void dialogShow() {}
}
