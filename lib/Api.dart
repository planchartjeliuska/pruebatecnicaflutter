import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pruebatecnicaflutter/models/User.dart';

import 'Album.dart';

const baseUrl = "https://jsonplaceholder.typicode.com";


class API {

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse("$baseUrl/users"));

    if (response.statusCode == 200){
      Iterable list = json.decode(response.body);
      return list.map((model) => User.fromJson(model)).toList();
    }else {
      throw Exception('Failed to load users');
    }

  }
  Future<User> getuserId(int id) async{
    final response = await  http.get(Uri.parse("$baseUrl/users/$id"));
    if (response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('Failed to load user');
    }
  }

}

