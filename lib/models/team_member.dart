// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeamMember {
  final String id;
  final String leader;
  final String fullName;
  final String college;
  final int phoneNo;
  final String email;
  TeamMember({
    required this.id,
    required this.leader,
    required this.fullName,
    required this.college,
    required this.phoneNo,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'leader': leader,
      'fullName': fullName,
      'college': college,
      'phoneNo': phoneNo,
      'email': email,
    };
  }

  factory TeamMember.fromMap(Map<String, dynamic> map) {
    return TeamMember(
      id: map['_id'] ?? "",
      leader: map['leader'] ?? "",
      fullName: map['fullName'] ?? "",
      college: map['college'] ?? "",
      phoneNo: map['phoneNo'] ?? 0,
      email: map['email'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamMember.fromJson(String source) =>
      TeamMember.fromMap(json.decode(source) as Map<String, dynamic>);
}
