import 'package:firebase_auth/laravel/controllers/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final TodoController _todoController = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20.0),
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade900,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Enter A todo'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    _todoController;
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Obx(
              () {
                return _todoController.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: _todoController.todos.value.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10.0),
                            width: double.infinity,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(_todoController
                                  .todos.value[index].name
                                  .toString()),
                              subtitle: Row(
                                children: [
                                  Checkbox(
                                    value: _todoController
                                                .todos.value[index].completed ==
                                            1
                                        ? true
                                        : false,
                                    onChanged: (value) {
                                      //
                                    },
                                  ),
                                  Text(
                                    _todoController
                                                .todos.value[index].completed ==
                                            1
                                        ? 'Completed'
                                        : 'Pending',
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
