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
            loginId TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL,
            fullName TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<String> addUser(Users user) async {
    // Check ID already exists
    final db = await database;
    final result = await db.query(
      'users',
      where: 'loginId = ?',
      whereArgs: [user.loginId],
    );

    if (result.isNotEmpty) {
      //ID already exists
      return 'Login ID is taken. Please create a new one.';
    }
    // login_id does not exist
    await db.insert('users', user.toJson());
    return 'User added successfully.';
  }

  Future<bool?> checkUserExists(String loginId, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'loginId = ? AND password = ?',
      whereArgs: [loginId, password]
      );

    return result.isNotEmpty;
  }

  Future<int> updateUser(Users user) async {
    final db = await database;
    return await db.update(
      'users',
      user.toJson(),
      where: 'loginId = ?', // loginId unique field
      whereArgs: [user.loginId],
    );
  }

  Future<int> deleteUser(int loginId) async {
    final db = await database;
    return await db.delete(
      'users',
      where: 'loginId = ?', // loginId unique field
      whereArgs: [loginId],
    );
  }
}
