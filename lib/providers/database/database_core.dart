import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseCore {
  dbConnect() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'tasko.db'),
      onCreate: ((db, version) async {
        return db.execute('CREATE TABLE task(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, desc TEXT)');
        //wait db.execute('CREATE TABLE task(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, desc TEXT)');

      }),
      version: 2,
      onUpgrade: (db, oldVersion, newVersion) {
        if(oldVersion < newVersion) {
          return db.execute(
              'CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, is_done INTEGER, task_id INTEGER)');
        }
      },
    );

    return database;
  }

}
