// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String fullName;
  final String college;
  final int phoneNo;
  final String email;
  final String password;
  final String type;
  final String token;
  User({
    required this.id,
    required this.fullName,
    required this.college,
    required this.phoneNo,
    required this.email,
    required this.password,
    required this.type,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'college': college,
      'phoneNo': phoneNo,
      'email': email,
      'password': password,
      'type': type,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      fullName: map['fullName'] as String,
      college: map['college'] as String,
      phoneNo: map['phoneNo'] as int,
      email: map['email'] as String,
      password: map['password'] as String,
      type: map['type'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
