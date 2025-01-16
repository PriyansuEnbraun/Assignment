import 'dart:ffi';

import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String loginId;
  final String password;
  final String fullName;

  const SignUpEntity(
      { required this.loginId, required this.password, required this.fullName});



  @override
  List<Object?> get props => [loginId, password, fullName];
}
