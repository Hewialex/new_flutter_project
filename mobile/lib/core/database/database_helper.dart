import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class User {
  final String userName;
  final String userId;

  const User({
    required this.userName,
    required this.userId,
  });
}

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'auth.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE session (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            isActive INTEGER NOT NULL DEFAULT 0,
            gender TEXT NOT NULL 
        )
        ''');
        db.execute('''
          CREATE TABLE tokens (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            bearerToken TEXT NOT NULL
          )
        ''');
        db.execute('''
        CREATE TABLE userData (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId TEXT NOT NULL,
            userName TEXT NOT NULL
        )
        ''');
      },
    );
  }

  Future<void> saveSession(String gender) async {
    final db = await database;

    db.delete('session');

    await db.insert(
      'session',
      {
        'isActive': 1,
        'gender': gender,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> getSession() async {
    final db = await database;
    final result = await db.query('session', limit: 1);

    if (result.isNotEmpty) {
      return result.first['isActive'] == 1;
    } else {
      return false;
    }
  }

  Future<String> getGender() async {
    final db = await database;
    final result = await db.query('session', limit: 1);

    if (result.isNotEmpty) {
      return result.first['gender'] as String;
    }
    return "Male";
  }

  Future<void> saveToken(String token) async {
    final db = await database;

    await db.delete('tokens');

    await db.insert(
      'tokens',
      {'bearerToken': token},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String?> getToken() async {
    final db = await database;

    final result = await db.query('tokens', limit: 1);

    if (result.isNotEmpty) {
      return result.first['bearerToken'] as String;
    } else {
      return null;
    }
  }

  Future<void> deleteToken() async {
    final db = await database;

    await db.delete('tokens');
  }

  Future<void> saveUser(User user) async {
    final db = await database;

    await db.delete('userData');

    await db.insert(
      'userData',
      {
        'userId': user.userId,
        'userName': user.userName,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<User?> getUser() async {
    final db = await database;

    final result = await db.query('userData', limit: 1);

    if (result.isNotEmpty) {
      return User(
          userName: result.first['userName'] as String,
          userId: result.first['userId'] as String);
    }
    return null;
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }

  Future<void> deleteDatabaseFile() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'auth.db');
    await deleteDatabase(path);
    debugPrint('Database deleted.');
  }
}
