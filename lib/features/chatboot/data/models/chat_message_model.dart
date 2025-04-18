class ChatMessageModel {
  final String message;
  final bool isUser;

  ChatMessageModel({required this.message, required this.isUser});
}

class Messages {
  final bool isUser;
  final String message;
  final DateTime date;

  Messages({
    required this.isUser,
    required this.message,
    required this.date,
  });
}
