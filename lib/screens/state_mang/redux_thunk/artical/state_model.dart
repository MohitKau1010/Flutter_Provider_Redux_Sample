import 'package:meta/meta.dart';
import 'package:welcomeflutter/screens/state_mang/redux_thunk/model/artical.dart';

@immutable
class ArticalsState {
  final bool isError;
  final bool isLoading;
  final List<Artical> artical;

  ArticalsState({
    this.isError,
    this.isLoading,
    this.artical,
  });

  factory ArticalsState.initial() => ArticalsState(
    isLoading: false,
    isError: false,
    artical: const [],
  );

  ArticalsState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required List<Artical> posts,
  }) {
    return ArticalsState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      artical: posts ?? this.artical,
    );
  }
}
