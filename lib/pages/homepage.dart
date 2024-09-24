import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:functional_todo/util/dialog_box.dart';
import 'package:functional_todo/util/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller=TextEditingController();
  // List to hold task data
  List todoList = [
    ['Make Tutorial',  true],
    ['Do Exercise',  false],
    ['Trip Expense', false],
  ];

  // Function to handle task completion status change
  void onChanged(int index, bool? value) {
    setState(() {
     todoList[index][1]=!todoList[index][1];
    });
  }

void saveNewTask(){
  setState(() {
    todoList.add([_controller.text, false]);

  });
  Navigator.of(context).pop();
}

  void cretaNewTask()
  {
    showDialog
    (
      context: context, 
    builder: (context)
    {
      return DialogBox(
      controller: _controller,
      onSave: saveNewTask,
      onCancel: () => Navigator.of(context).pop(),
      onRename: () => Navigator.of(context).pop()
      );
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('TO DO'),
        centerTitle: true,
        // elevation: 1000,
      ),
      floatingActionButton: FloatingActionButton(onPressed: cretaNewTask,
      child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName:todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => onChanged(index, value),
          );
        },
      ),
    );
  }
}
