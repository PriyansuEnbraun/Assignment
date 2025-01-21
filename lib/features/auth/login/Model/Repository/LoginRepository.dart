import 'package:assignment/features/auth/signup/Model/Data/DatabaseService.dart';

class LoginRepository{

  final DatabaseService _databaseService = DatabaseService();

  //checkUser Exist
  Future<bool?> checkUserExists(String loginId, String password) async {
    try {
      return await _databaseService.checkUserExists(loginId, password);
    } catch (e) {
      throw Exception('Error checking user in database: $e');
    }
  }
}