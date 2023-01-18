import 'package:flutter/material.dart';
import 'package:tasko/models/todo.dart';
import 'package:tasko/widgets/add_new_todo.dart';
import 'package:tasko/widgets/todo_item.dart';

import '../models/task.dart';
import '../providers/database/todo_db.dart';

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
    Todo newTodo = Todo(title: value, isDone: 0, taskId: widget.newTask?.id ?? 0);
    TodoDB().add(newTodo);
    todoList.add(newTodo);
    setState(() {});
  }

  getTaskTodos(int taskId) async {
    todoList = await TodoDB().getAll(taskId);
    setState(() { });
  }

  toggleDone(todoId, isDone) async {
    await TodoDB().update(todoId, isDone==1?0:1);

    todoList.map((item) {
        if(item.id == todoId) item.isDone = isDone==1?0:1;
      }
    ).toList();
    setState(() { });
  }

  deleteTodo(todoId) async{
    await TodoDB().delete(todoId);
    todoList.removeWhere((todo) => todo.id ==  todoId);
    setState(() { });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.newTask != null) {
      titleInputController.text = widget.newTask?.title ?? "";
      deskInputController.text = widget.newTask?.desc ?? "";
    }
    getTaskTodos(widget.newTask?.id ?? 0);
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
                                      title: value
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
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                          return TodoItem(
                              id: todoList[index].id ?? 0,
                              title: todoList[index].title,
                              isDone: todoList[index].isDone,
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
