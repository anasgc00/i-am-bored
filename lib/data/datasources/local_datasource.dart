import 'package:i_am_bored/core/errors/exceptions.dart';
import 'package:i_am_bored/core/mappers/activity_list_mapper.dart';
import 'package:i_am_bored/domain/entities/activity_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/activity_mode.dart';

abstract class ActivityLocalDataSource {
  Future<List<Activity>> getSavedActivities();
  Future<Activity> getActivity(String key);
  Future<void> insertActivity(ActivityModel activity);
  Future<void> deleteSavedActivity(String key);
}

class ActivityLocalDataSourceImpl implements ActivityLocalDataSource {
  final _databaseName = 'activity';
  final _databaseVersion = 1;
  final _tableName = 'activity';
  final _columnKey = 'key';
  final _columnActivity = 'activity';
  final _columnPrice = 'price';
  final _columnParticipants = 'participants';
  final _columnType = 'type';
  final _columnLink = 'link';
  final _columnAccessibility = 'accessibility';
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  @override
  Future<void> deleteSavedActivity(String key) async {
    final db = await database;
    db.delete(
      _tableName,
      where: '$_columnKey = ?',
      whereArgs: [key],
    );
  }

  @override
  Future<Activity> getActivity(String key) async {
    final db = await database;
    final queryResult = await db.query(
      _tableName,
      where: '$_columnKey = ?',
      whereArgs: [key],
    );
    if (queryResult.isNotEmpty) {
      return ActivityModel.fromJson(queryResult.first);
    } else {
      throw ConvertException();
    }
  }

  @override
  Future<List<Activity>> getSavedActivities() async {
    final db = await database;
    final queryResult = await db.query(_tableName);
    if (queryResult.isNotEmpty) {
      return TodoListMapper().mapList(queryResult);
    } else {
      throw ConvertException();
    }
  }

  @override
  Future<void> insertActivity(ActivityModel activity) async {
    final db = await database;
    db.insert(_tableName, activity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE activity (
            $_columnKey TEXT PRIMARY KEY,
            $_columnActivity TEXT,
            $_columnType TEXT,
            $_columnParticipants INT,
            $_columnPrice INT,
            $_columnLink TEXT,
            $_columnAccessibility INT
          )
        ''');
      },
      version: _databaseVersion,
    );
  }
}
