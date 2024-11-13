import 'dart:convert';
import 'package:indriver_clone_flutter/src/data/api/ApiConfig.dart';
import 'package:http/http.dart' as http;
import 'package:indriver_clone_flutter/src/domain/models/AuthResponse.dart';

class Authservice {


  Future<AuthResponse?> login(String email, String password) async {

    try {
      Uri url = Uri.http(ApiConfig.API_PROYECT, '/auth/login');
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = json.encode({
        'email': email,
        'password': password
      });
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      AuthResponse authResponse = AuthResponse.fromJson(data);
      print('Data Remote: ${authResponse.toJson()}');
      print('Token: ${authResponse.token}');
    } catch (e) {
      print('Error: $e');
      return null;
    }




  }
}