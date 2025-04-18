class PostEntity {
  final String id;
  final String userId;
  final String text;
  final String? imageUrl;
  final DateTime createdAt;

  PostEntity({
    required this.id,
    required this.userId,
    required this.text,
    this.imageUrl,
    required this.createdAt,
  });
}
