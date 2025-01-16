import 'package:assignment/features/auth/signup/Model/Entities/SignUpEntity.dart';
import 'package:flutter/material.dart';

import '../../signup/Model/Tables/Users.dart';

class LoginViewModel extends ChangeNotifier {


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

  bool? checkInUserData(String loginId, String password) {
    for(var user in Users.sampleList){
      if(user.loginId==loginId && user.password==password){
        return true;
      }
    }
    return false ;
  }

}
