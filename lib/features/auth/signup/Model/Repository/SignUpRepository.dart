import '../Database/DatabaseService.dart';
import '../Tables/Users.dart';

class UserRepository {

  final DatabaseService _databaseService = DatabaseService();

  // Add User
  Future<String> addUser(Users user) async {
    try {
      return await _databaseService.addUser(user);
    } catch (e) {
      throw Exception('Error adding user to database: $e');
    }
  }



  // Update User
  Future<int> updateUser(Users user) async {
    try {
      return await _databaseService.updateUser(user);
    } catch (e) {
      throw Exception('Error updating user in database: $e');
    }
  }

  // Delete
  Future<int> deleteUser(int id) async {
    try {
      return await _databaseService.deleteUser(id);
    } catch (e) {
      throw Exception('Error deleting user from database: $e');
    }
  }
}