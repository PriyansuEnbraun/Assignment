import 'package:assignment/features/auth/signup/Model/Entities/SignUpEntity.dart';

class Users extends SignUpEntity {
  final String loginId;
  final String password;
  final String fullName;

  const Users({
    required this.loginId,
    required this.password,
    required this.fullName,
  }) : super( loginId: loginId, password: password, fullName: fullName);


  static List<SignUpEntity> sampleList = [
    SignUpEntity( loginId: 'user1', password: 'user1pass@', fullName: 'Albert'),
    SignUpEntity( loginId: 'user2', password: 'user2Pass@', fullName: 'Bob'),
    SignUpEntity(loginId: 'user3', password: 'user3Pass@', fullName: 'Charlie'),
    SignUpEntity(loginId: 'user4', password: 'user4Pass@', fullName: 'David'),
    SignUpEntity(loginId: 'user5', password: 'user5Pass@', fullName: 'Eve'),
    SignUpEntity( loginId: 'user6', password: 'user6Pass@', fullName: 'Frank'),
    SignUpEntity( loginId: 'user7', password: 'user7Pass@', fullName: 'Grace'),
    SignUpEntity( loginId: 'user8', password: 'user8Pass@', fullName: 'Henry'),
    SignUpEntity( loginId: 'user9', password: 'user9Pass@', fullName: 'Ivy'),
    SignUpEntity( loginId: 'user10', password: 'user10Pass@', fullName: 'Jack'),
  ];


  factory Users.fromJson(Map<String, dynamic> json) {
    if(!json.containsKey('loginId') || json['loginId'] == null){
      throw Exception('Login ID is required');
    }
    if(!json.containsKey('password') || json['password'] == null){
      throw Exception('Password is required');
    }
    if(!json.containsKey('fullName') || json['fullName'] == null){
      throw Exception('Full Name is required');
    }
    return Users(
      loginId: json['loginId'],
      password: json['password'],
      fullName: json['fullName'],
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loginId'] = loginId;
    data['password'] = password;
    data['fullName'] = fullName;
    return data;
  }





}
