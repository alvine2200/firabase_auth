import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api/';

  Future login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}login'),
      headers: {'Content-type': 'application/json'},
      body: jsonDecode({'email': email, 'password': password} as String),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonEncode( const Text('Something Went Wrong'));
    }
  }
}
