class PostModel {
  final String userId;
  final String text;
  final String? imageUrl;

  PostModel({
    required this.userId,
    required this.text,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'text': text,
      'image_url': imageUrl,
    };
  }
}
