import 'package:flutter/material.dart';
import 'package:tasko/models/todo.dart';

import '../models/task.dart';

class AddNewTodo extends StatelessWidget {
  final Function addNewTodoFn;
  AddNewTodo({required this.addNewTodoFn});
  TextEditingController todoInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: todoInputController,
      onSubmitted: (value) {
        addNewTodoFn(value);
        todoInputController.clear();
      },
      decoration: InputDecoration(
        hintText: "کار جدید به لیست کارها اضافه نمایید  ",
      ),
    );
  }
}
