import 'dart:convert';
import '../models/user.dart';
import 'package:http/http.dart' as http;

const serverUrl = 'http://192.168.1.103:3000/users';
Future<User> createUser(String email, String password) async {
  final response = await http.post(
    Uri.parse(serverUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create User.');
  }
}

Future<User> getUsers() async {
  final response =
      await http.get(Uri.parse(serverUrl), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  return User.fromJson(jsonDecode(response.body));
}
