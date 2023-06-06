import 'dart:convert';

import 'package:firebase_auth/laravel/models/todo_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  RxBool loading = false.obs;
  //load the model data
  Rx<List<TodoModel>> todos = Rx<List<TodoModel>>([]);

  @override
  void onInit() {
    super.onInit();
    getAllTodo();
  }

  static const String serverIp = "http://192.168.0.168:80/api/";

  Future getAllTodo() async {
    try {
      todos.value.clear();
      loading.value = true;
      var response = await http.get(Uri.parse('${serverIp}todos'), headers: {
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        loading.value = false;
        final content = json.decode(response.body)['data'];
        // debugPrint(content);
        //for loop tolopp through data
        for (var item in content) {
          todos.value.add(TodoModel.fromJson(item));
        }
        return;
      } else {
        loading.value = false;
        return jsonDecode(response.body);
      }
    } catch (e) {
      loading.value = false;
      debugPrint(e.toString());
      return;
    }
  }
}
