import 'package:rxdart/rxdart.dart';
import 'package:welcomeflutter/models/Data.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/models/Data.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/models/getList.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/resources/repository.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<GetList>();

  Stream<GetList> get allMovies => _moviesFetcher.stream;

  ///stream for getting the data from the api

  fetchAllMovies() async {
    /*if (_isDisposed) {
      return;
    }*/

    GetList data = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(data);
    //print("object :    $data");

//    ItemModel itemModel = await _repository.fetchAllMovies();
//    _moviesFetcher.sink.add(itemModel);/// sink is used for adding the data into model.
  }

  bool _isDisposed = false;

  dispose() {
    _moviesFetcher.close();

    /// close PublishSubject
    //_isDisposed = true;
  }
}

final bloc = MoviesBloc();

/// constunter variable for calling the methods.
