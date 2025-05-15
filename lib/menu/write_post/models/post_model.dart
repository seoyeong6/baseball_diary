import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String? id; // Firestore 문서 ID
  final String title;
  final String content;
  final String emotion; // 감정 이미지 파일명 or 키
  final DateTime createdAt;
  final String? userId; // 로그인된 유저만 저장

  PostModel({
    this.id,
    required this.title,
    required this.content,
    required this.emotion,
    required this.createdAt,
    this.userId,
  });

  /// Firestore 저장용 JSON 변환
  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'emotion': emotion,
    'createdAt': createdAt.toIso8601String(),
    'userId': userId,
  };

  /// Firestore 또는 local에서 불러올 때 사용
  factory PostModel.fromJson(Map<String, dynamic> json, {String? id}) {
    final rawCreatedAt = json['createdAt'];

    DateTime createdAt;

    if (rawCreatedAt is Timestamp) {
      createdAt = rawCreatedAt.toDate();
    } else if (rawCreatedAt is String) {
      createdAt = DateTime.tryParse(rawCreatedAt) ?? DateTime.now();
    } else {
      createdAt = DateTime.now();
    }

    return PostModel(
      id: id,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      emotion: json['emotion'] ?? '',
      createdAt: createdAt,
      userId: json['userId'],
    );
  }
}
