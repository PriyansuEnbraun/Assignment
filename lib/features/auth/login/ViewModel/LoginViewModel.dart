import 'package:assignment/features/auth/login/Model/Repository/LoginRepository.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {

  final LoginRepository _loginRepository = LoginRepository();

  String? validateLogin(String loginId, String password) {
    if (loginId.isEmpty) {
      return 'Login ID cannot be empty';
    }
    if (password.isEmpty) {
      return 'Password cannot be empty';
    }
    if (password.length < 8 || password.length > 50) {
      return 'Password must be between 8 and 50 characters';
    }
    RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,50}$',
    );
    if (!passwordRegExp.hasMatch(password)) {
      return 'Password must contain letters, numbers, and special characters';
    }
    return null;
  }

  //check user exist

  Future<bool?> checkUserExists(String loginId, String password) async {
    try {
      return await _loginRepository.checkUserExists( loginId, password);
    } catch (e) {
      print('Error checking user: $e');
    }
    return null;
  }


}
