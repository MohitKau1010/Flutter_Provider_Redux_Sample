import 'package:rxdart/rxdart.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/models/getList.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/resources/repository.dart';

class UsersBloc {
  final _repository = Repository();
  final _usersFetcher = PublishSubject<GetList>();

  Stream<GetList> get AllUsers => _usersFetcher.stream;

  ///stream for getting the data from the api

  fetchAllUsers() async {
    GetList data = await _repository.fetchAllUsers();
    _usersFetcher.sink.add(data);
  }

  dispose() {
    _usersFetcher.drain();
    _usersFetcher.close();

    /// close PublishSubject
  }
}

final bloc = UsersBloc();

///constunter variable for calling the methods.
