import 'package:assignment/features/auth/signup/Model/Data/AuthBackendService.dart';
import 'package:assignment/features/auth/signup/Model/Data/DatabaseService.dart';

class LoginRepository{

  final DatabaseService _databaseService = DatabaseService();
  final AuthBackendService _authBackendService = AuthBackendService();

  //checkUser Exist
  Future<bool?> checkUserExists(String loginId, String password) async {
    try {
      return await _authBackendService.login(loginId, password);
    } catch (e) {
      throw Exception('Error checking user in database: $e');
    }
  }
}