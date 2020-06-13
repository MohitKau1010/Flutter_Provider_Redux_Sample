import 'package:welcomeflutter/screens/state_mang/redux_thunk/artical/actions.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/artical/state_model.dart';

articalsReducer(ArticalsState prevState, SetPostsStateAction action) {
  final payload = action.postsState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    posts: payload.artical,
  );
}
