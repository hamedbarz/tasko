import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseCore {
  dbConnect() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'tasko.db'),
      onCreate: ((db, version) {
        return db.execute(
            'CREATE TABLE task(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, desc TEXT)');
      }),
      version: 1,
    );

    return database;
  }

}
