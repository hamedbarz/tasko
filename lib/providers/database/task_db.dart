import 'package:sqflite/sqflite.dart';
import 'package:tasko/models/task.dart';
import 'package:tasko/providers/database/database_core.dart';

class TaskDB extends DatabaseCore {

  Future<int> add(Task task) async {
    Database db = await dbConnect();
    int id = await db.insert('task', task.toMap());
    return id;
  }

  Future<List<Task>> getAll() async {
    Database db = await dbConnect();
    List<Map<String, dynamic>> result = await db.query('task');

    return List.generate(result.length, (index) =>
        Task(
            id: result[index]['id'],
            title: result[index]['title'],
            desc: result[index]['desc'])
    );
  }

  Future<int> update(int taskId, Task task) async{
    Database db = await dbConnect();
    int id = await db.update('task', task.toMap(), where: 'id=?', whereArgs: [taskId]);
    return id;
  }

  Future<int> delete(taskId) async{
    Database db = await dbConnect();
    return await db.delete('task', where: 'id=?', whereArgs: [taskId]);
    // return id;
  // print("delete: " + id.toString());
  // re/turn id;
  }

}