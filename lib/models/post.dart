// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Post {
  final String username;
  final String type;
  final String title;
  final String description;
  final String date;
  Post({
    required this.username,
    required this.type,
    required this.title,
    required this.description,
    required this.date,
  });
 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'type': type,
      'title': title,
      'description': description,
      'date': date,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      username: map['username'] as String,
      type: map['type'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
