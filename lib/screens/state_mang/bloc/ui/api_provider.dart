import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:welcomeflutter/screens/state_mang/bloc/models/getList.dart';

class ApiProvider {
  Client client = Client();
  final _baseUrl = "https://reqres.in/api";

  Future<GetList> fetchUsersList() async {
    Response response;
    response = await client.get("$_baseUrl/users?page=2");

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return GetList.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load users');
    }
  }
}
