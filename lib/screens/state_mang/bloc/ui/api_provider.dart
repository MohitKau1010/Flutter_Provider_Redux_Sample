import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client, Response;
import 'package:welcomeflutter/screens/state_mang/bloc/models/Data.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/models/getList.dart';

//import '../models/item_model.dart';
//import '../models/trailer_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _baseUrl = "https://reqres.in/api";

  ///var data = await http.get("https://reqres.in/api/users?page=2");

  Future<GetList> fetchMovieList() async {
    Response response;
    response = await client.get("$_baseUrl/api/unknown");

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return GetList.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load users');
    }
  }

/*Future<ItemModel> fetchMovieList() async {
    Response response;
    if(_apiKey != 'api-key') {
      response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    }else{
      throw Exception('Please add your API key');
    }
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }*/

/*Future<TrailerModel> fetchTrailer(int movieId) async {
    final response =
    await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }*/
}
