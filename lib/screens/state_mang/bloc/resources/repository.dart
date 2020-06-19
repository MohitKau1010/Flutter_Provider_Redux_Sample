import 'dart:async';

import 'package:welcomeflutter/screens/state_mang/bloc/models/Data.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/models/getList.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/ui/api_provider.dart';

class Repository {
  ///api provider class is used for handling response.
  final moviesApiProvider = MovieApiProvider();

  ///get user
  Future<GetList> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  ///call api
//Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  ///cal api
//Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}
