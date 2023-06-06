import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Container(
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
                    //
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
            Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: const Text('Todo text here'),
                subtitle: Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {
                        //
                      },
                    ),
                    const Text('Incomplete'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
