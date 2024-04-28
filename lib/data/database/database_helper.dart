import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/task.dart';

class DatabaseHelper {
  static Database? _database;

  Future openDatabaseFunc() async {
    if (_database != null) {
      return _database;
    }
// Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'task_manager.db');

    // If the database does not yet exist, create it
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('''
          CREATE TABLE tasks(
            id TEXT PRIMARY KEY,
            title TEXT,
            description TEXT,
            isDone INTEGER
          )
        ''');
    });
    log("message->database created");
    return _database;
  }

  Future<int> insertTask(Task task) async {
    Database db = await openDatabaseFunc();
    log("message->record added");
    return await db.insert('tasks', task.toMap());
  }

  Future<List<Task>> getTasks() async {
    Database db = await openDatabaseFunc();
    log("message->fetching record");
    List<Map<String, dynamic>> maps = await db.query('tasks');
    log("message->$maps");
    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }

  Future<int> deleteTask(String id) async {
    Database db = await openDatabaseFunc();
    log("message->record deleted");
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
