// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Volunteer {
  final String id;
  final String addedBy;
  final String modifiedBy;
  final String name;
  final int phoneNo;
  final String event;

  Volunteer(this.id, this.addedBy, this.modifiedBy, this.name, this.phoneNo,
      this.event);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'addedBy': addedBy,
      'modifiedBy': modifiedBy,
      'name': name,
      'phoneNo': phoneNo,
      'event': event,
    };
  }

  factory Volunteer.fromMap(Map<String, dynamic> map) {
    return Volunteer(
      map['_id'] ?? "",
      map['addedBy'] ?? "",
      map['modifiedBy'] ?? "",
      map['name'] ?? "",
      map['phoneNo'] ?? 0,
      map['event'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Volunteer.fromJson(String source) =>
      Volunteer.fromMap(json.decode(source) as Map<String, dynamic>);
}
