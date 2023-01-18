import 'package:sqflite/sqflite.dart';
import 'package:tasko/models/todo.dart';
import 'package:tasko/providers/database/database_core.dart';

class TodoDB extends DatabaseCore {

  Future<int> add(Todo todo) async {
    Database db = await dbConnect();
    int id = await db.insert('todo', todo.toMap());
    return id;
  }

  Future<List<Todo>> getAll(taskId) async {
    Database db = await dbConnect();
    List<Map<String, dynamic>> result = await db.query('todo', where: 'task_id = ?', whereArgs: [taskId]);

    return List.generate(result.length, (index) =>
        Todo(
            id: result[index]['id'],
            title: result[index]['title'],
            isDone: result[index]['is_done'],
            taskId: result[index]['task_id'])
    );
  }

  Future<int> update(int todoId, int isDone) async{
    Database db = await dbConnect();
    int id = await db.update('todo', {'is_done': isDone}, where: 'id=?', whereArgs: [todoId]);
    return id;
  }

  Future<int> delete(todoId) async{
    Database db = await dbConnect();
    return await db.delete('todo', where: 'id=?', whereArgs: [todoId]);
  }

}