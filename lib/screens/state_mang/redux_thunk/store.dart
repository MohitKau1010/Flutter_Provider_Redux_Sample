import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/artical/actions.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/artical/reducers.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/artical/state_model.dart';

///reducer
AppState appReducer(AppState state, dynamic action) {
  if (action is SetPostsStateAction) {
    final nextPostsState = articalsReducer(state.postsState, action);

    return state.copyWith(postsState: nextPostsState);
  }
  return state;
}


///AppState
@immutable
class AppState {
  final ArticalsState postsState;

  AppState({
    @required this.postsState,
  });

  AppState copyWith({
    ArticalsState postsState,
  }) {
    return AppState(
      postsState: postsState ?? this.postsState,
    );
  }
}

/// for get store & init_Redux
class Redux {
  static Store<AppState> _store;
  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final postsStateInitial = ArticalsState.initial();
    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(postsState: postsStateInitial),
    );
  }
}
