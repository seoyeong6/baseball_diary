// lib/menu/write_post/model/post_model.dart

class PostModel {
  final String title;
  final String content;
  final String emotion; // 감정 이미지 파일명 or 키
  final DateTime createdAt;
  final String? userId; // 로그인된 유저만 저장

  PostModel({
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
  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    title: json['title'] as String,
    content: json['content'] as String,
    emotion: json['emotion'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    userId: json['userId'] as String?,
  );
}
