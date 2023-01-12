import 'package:tasko/models/todo.dart';

class Task {
  int? id;
  String title;
  String? desc;
  List<Todo> todos;

  Task({this.id, required this.title, this.desc, required this.todos});

  Map<String, Object?> toMap(){
    return {
      'id' : id,
      'title' : title,
      'desc' : desc
    };
  }

  addTodo(value) {
    todos.add(Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        title: value,
        isDone: false));
  }

  toggleDone(id){
    todos.map((item) {
      if(item.id == id) item.isDone = ! item.isDone;
    }
    ).toList();
  }


  delete(id){
    todos.removeWhere((todoItem) => todoItem.id == id);
  }
}
