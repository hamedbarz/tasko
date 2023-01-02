import 'package:flutter/material.dart';
import 'package:tasko/models/task.dart';
import 'package:tasko/widgets/todo_item.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

List<Task> todoList = [];

//newTaskInputController = new input

TextEditingController todoInputController = new TextEditingController();

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'عنوان کار شما'
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "توضیحات کار خود را وارد نمایید",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                          return TodoItem(title: todoList[index].title,
                              isDone: todoList[index].isDone);
                        }
                    ),
                  ),

                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1,
                                color: Colors.grey
                            )
                        ),
                      ),
                      Expanded(
                          child: TextField(
                            controller: todoInputController,
                            onSubmitted: (value) {
                              setState(() {
                                todoList.add(Task(title: value, isDone: false));
                              });

                              todoInputController.clear();



                            },
                            decoration: InputDecoration(
                              hintText: "کار جدید به لیست کارها اضافه نمایید  ",
                            ),
                          )
                      )
                    ],
                  )
                ],


              ),
            )),
      ),
    );
  }
}
