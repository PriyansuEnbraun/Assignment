import 'package:assignment/features/auth/signup/Model/Tables/Users.dart';
import 'package:flutter/material.dart';

import '../Model/Repository/SignUpRepository.dart';

class SignUpViewModel extends ChangeNotifier {

  final UserRepository _userRepository = UserRepository();

  String? validateSignUp(String fullName, String loginId, String password , String confirmPassword ) {
    if (fullName.isEmpty) {
      return 'Full Name cannot be empty';
    }
    if (loginId.isEmpty) {
      return 'Login ID cannot be empty';
    }
    if (password.isEmpty) {
      return 'Password cannot be empty';
    }
    if (confirmPassword.isEmpty) {
      return 'Confirm Password cannot be empty';
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
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }


  Future<String?> addUser(String fullName, String loginId, String password) async {
    try {
      Users user = Users(
          fullName: fullName, loginId: loginId, password: password);
      return await _userRepository.addUser(user);
    } catch (e) {
      return ('Error adding user: $e');
    }
  }
}

