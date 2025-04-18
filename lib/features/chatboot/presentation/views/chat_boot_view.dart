import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:login/features/chatboot/data/models/chat_message_model.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});
    static const routeName = "ChatBotScreen";

  @override
  State<ChatBotScreen> createState() => _BotPageState();
}

class _BotPageState extends State<ChatBotScreen> {
  TextEditingController _userMessage = TextEditingController();
  static const apiKey = "AIzaSyAVqLxFqbHllwPelNxWGQeqPW_UR97yzOk";
  final model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: apiKey,
  );
  final List<Messages> _messagesList = [];

  Future<void> sendMessage() async {
    final msg = _userMessage.text;
    _userMessage.clear();

    if (msg.isNotEmpty) {
      setState(() {
        _messagesList
            .add(Messages(isUser: true, message: msg, date: DateTime.now()));
      });

      final content = [Content.text(msg)];

      try {
        final response = await model.generateContent(content);
        setState(() {
          _messagesList.add(Messages(
            isUser: false,
            message: response.text ?? "No response received",
            date: DateTime.now(),
          ));
        });
      } catch (e) {
        setState(() {
          _messagesList.add(Messages(
            isUser: false,
            message: "Error: ${e.toString()}",
            date: DateTime.now(),
          ));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gemini Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messagesList.length,
              itemBuilder: (context, index) {
                final message = _messagesList[index];
                return ChatScreen(
                  isUser: message.isUser,
                  message: message.message,
                  date: DateFormat('HH:mm').format(message.date),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 15,
                  child: TextFormField(
                    controller: _userMessage,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelText: "Ask Gemini...", // Changed label to labelText
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(15),
                  iconSize: 30,
                  color: Colors.white,
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
    required this.isUser,
    required this.message,
    required this.date,
  });

  final bool isUser;
  final String message;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
        left: isUser ? 100 : 10,
        right: isUser ? 10 : 100,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: isUser ? const Radius.circular(30) : Radius.zero,
          bottomRight: isUser ? Radius.zero : const Radius.circular(30),
          topLeft: const Radius.circular(30),
          topRight: const Radius.circular(30),
        ),
        color: isUser
            ? Colors.deepPurple
            : Colors.grey.shade200, // Adjusted color for better visibility
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
              color: isUser ? Colors.white : Colors.black,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: isUser ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
