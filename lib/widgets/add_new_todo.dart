
import 'package:flutter/material.dart';

class AddNewTodo extends StatelessWidget {
 // const AddNewTodo({Key? key}) : super(key: key);
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
