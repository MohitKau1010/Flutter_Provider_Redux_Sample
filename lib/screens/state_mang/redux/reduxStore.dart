import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:welcomeflutter/screens/state_mang/redux/state/AppState.dart';
import 'package:welcomeflutter/screens/state_mang/redux/state/reducer.dart';



/// for get store & init_Redux
class ReduxStore {
  static Store<RAppState> _store;
  static Store<RAppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final _initialState = RAppState(sliderFontSize: 0.20);
     _store = Store<RAppState>(
        reducer,
        initialState: _initialState
    );
  }
}
