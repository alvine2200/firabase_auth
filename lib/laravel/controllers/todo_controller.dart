import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllTodo();
  }

  static const String serverIp = "http://192.168.43.177:80/api/";

  Future getAllTodo() async {
    try {
      var response = await http.get(Uri.parse('${serverIp}todos'), headers: {
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        debugPrint(response.body);
        return jsonDecode(response.body);
      } else {
        debugPrint(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
      return jsonDecode(e.toString());
    }
  }
}
