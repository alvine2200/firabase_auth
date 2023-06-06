import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  static const String serverIp = "http://192.168.43.177:80/api/";
  Future getAllTodo() async {
    try {
      var response = await http.get(Uri.parse('${serverIp}todos'));
      debugPrint(response.body);
      return;
    } catch (e) {
      //
      debugPrint(e.toString());
    }
  }
}
