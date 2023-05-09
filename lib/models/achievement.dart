// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Achievement {
  final String title;
  final String category;
  final String description;
  final int noOfParticipant;
  final String tag;
  final List<String> images;

  Achievement({
    required this.title,
    required this.category,
    required this.description,
    required this.noOfParticipant,
    required this.tag,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'category': category,
      'description': description,
      'noOfParticipant': noOfParticipant,
      'tag': tag,
      'images': images,
    };
  }

  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      title: map['title'] ?? "",
      category: map['category'] ?? "",
      description: map['description'] ?? "",
      noOfParticipant: map['noOfParticipant'] ?? 0,
      tag: map['tag'] ?? "",
      images: List<String>.from(
        (map['images']),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Achievement.fromJson(String source) =>
      Achievement.fromMap(json.decode(source) as Map<String, dynamic>);
}
