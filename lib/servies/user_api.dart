import 'dart:convert';
import 'package:api3/model/user.dart';
import 'package:http/http.dart' as http;

import '../model/user_name.dart';

class UserApi{
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
      final result = json['results'] as List<dynamic>;
      final users = result.map((e) {
        return User.fromMap(e);
      }).toList();
      return users;
  }
}