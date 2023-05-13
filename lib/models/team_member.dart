import 'dart:convert';

class TeamMember {
  final String leader;
  final String fullName;
  final String college;
  final int phoneNo;
  final String email;
  TeamMember({
    required this.leader,
    required this.fullName,
    required this.college,
    required this.phoneNo,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'leader': leader,
      'fullName': fullName,
      'college': college,
      'phoneNo': phoneNo,
      'email': email,
    };
  }

  factory TeamMember.fromMap(Map<String, dynamic> map) {
    return TeamMember(
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
