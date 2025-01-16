import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:assignment/features/auth/signup/Model/Tables/Users.dart';

class DatabaseService {

  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;

  static Database? _database;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'UserDatabase.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            loginId TEXT NOT NULL,
            password TEXT NOT NULL,
            fullName TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> addUser(Users user) async {
    final db = await database;
    return await db.insert('users', user.toJson());
  }

  Future<List<Users>> fetchUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) => Users.fromJson(maps[i]));
  }

  Future<int> updateUser(Users user) async {
    final db = await database;
    return await db.update(
      'users',
      user.toJson(),
      where: 'loginId = ?', // We update by loginId or another unique field
      whereArgs: [user.loginId],
    );
  }

  Future<int> deleteUser(int loginId) async {
    final db = await database;
    return await db.delete(
      'users',
      where: 'loginId = ?', // We update by loginId or another unique field
      whereArgs: [loginId],
    );
  }
}
