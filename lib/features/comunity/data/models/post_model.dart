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
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['user_id'],
      text: json['text'],
      imageUrl: json['image_url'],
    );
  }
}
