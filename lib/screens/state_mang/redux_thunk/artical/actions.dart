import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:welcomeflutter/screens/state_mang/redux_thunk/artical/state_model.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/model/artical.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/store.dart';

@immutable
class SetPostsStateAction {
  final ArticalsState postsState;

  SetPostsStateAction(this.postsState);
}

Future<void> fetchPostsAction(Store<AppState> store) async {
  store.dispatch(SetPostsStateAction(ArticalsState(isLoading: true)));

  try {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');
    assert(response.statusCode == 200);
    final jsonData = json.decode(response.body);
    store.dispatch(
      SetPostsStateAction(
        ArticalsState(
          isLoading: false,
          artical: Artical.listFromJson(jsonData),
        ),
      ),
    );
  } catch (error) {
    store.dispatch(SetPostsStateAction(ArticalsState(isLoading: false)));
  }
}
