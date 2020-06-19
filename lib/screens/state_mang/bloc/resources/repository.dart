import 'dart:async';

import 'package:welcomeflutter/screens/state_mang/bloc/models/getList.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/ui/api_provider.dart';

class Repository {
  ///api provider class is used for handling response.
  final apiProvider = ApiProvider();

  ///get user
  Future<GetList> fetchAllUsers() => apiProvider.fetchUsersList();
}
