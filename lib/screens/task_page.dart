import 'package:flutter/material.dart';
import 'package:tasko/models/todo.dart';
import 'package:tasko/widgets/add_new_todo.dart';
import 'package:tasko/widgets/todo_item.dart';

import '../models/task.dart';

class TaskPage extends StatefulWidget {
  //const TaskPage({Key? key}) : super(key: key);
  final String? title;
  Task? newTask;
  TaskPage({this.title, this.newTask});

  @override
  State<TaskPage> createState() => _TaskPageState();

}


class _TaskPageState extends State<TaskPage> {
  List<Todo> todoList = [];
  TextEditingController titleInputController = TextEditingController();
  TextEditingController deskInputController = TextEditingController();



  addNewTodo(value) {
    widget.newTask?.addTodo(value);
    setState(() {});
  }

  toggleDone(id){
    widget.newTask?.toggleDone(id);
    setState(() {});
  }

  deleteTodo(id){
    widget.newTask?.delete(id);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.newTask != null) {
      titleInputController.text = widget.newTask?.title ?? "";
      deskInputController.text = widget.newTask?.desc ?? "";
    }
  }

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
                          Navigator.pop(context, widget.newTask);
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: titleInputController,
                            onSubmitted: (value) {
                              setState(() {
                                if(widget.newTask == null){
                                  widget.newTask = Task(
                                      title: value,
                                      todos: todoList
                                  );
                                }else{
                                  widget.newTask?.title = value;
                                }
                              });
                            },
                            decoration: const InputDecoration(
                                hintText: 'عنوان کار شما'
                            ),
                            style: const TextStyle(
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
                    child: Visibility(
                      visible: widget.newTask != null,
                      child: TextField(
                        controller: deskInputController,
                        onSubmitted: (value) {
                          widget.newTask?.desc = value;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "توضیحات کار خود را وارد نمایید",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.newTask?.todos.length ?? 0,
                      itemBuilder: (context, index) {
                          return TodoItem(
                              id: widget.newTask?.todos[index].id ?? 0,
                              title: widget.newTask?.todos[index].title ?? "",
                              isDone: widget.newTask?.todos[index].isDone ?? false,
                              toggleDone: toggleDone,
                              deleteTodo: deleteTodo,
                          );
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
                           child: Visibility(
                               visible: widget.newTask != null,
                               child: AddNewTodo(addNewTodoFn: addNewTodo,)
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
