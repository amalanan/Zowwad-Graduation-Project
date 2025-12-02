import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> messages = [
      {
        'text':
            '"Welcome to Wefrh! 🎉 We’ve got amazing services waiting for you!"',
        'time': 'Read 9:15 PM',
        'isSentByUser': true,
      },
      {
        'text': '"Exclusive deals and discounts are just a click away! 🛒💥"',
        'time': '11:01 AM',
        'isSentByUser': false,
      },
      {
        'text': '"Need help? We\'re here to make your shopping easier! 😎"',
        'time': '11:01 AM',
        'isSentByUser': false,
      },
      {
        'text':
            '"Sorry, let it be a surprise! I just wanted to thank you for your continued help to everyone. 👏"',
        'time': 'Read 9:15 PM',
        'isSentByUser': true,
      },
      {
        'text':
            '"Thanks for reaching out! Let us know how we can assist you. 🙏💬"',
        'time': '11:01 AM',
        'isSentByUser': false,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        final isUser = msg['isSentByUser'] as bool;
        return Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.all(12),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              decoration: BoxDecoration(
                color:
                    isUser ? const Color(0xFF1E1E2C) : const Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                msg['text'],
                style: TextStyle(
                  color: isUser ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                msg['time'],
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 4),
          ],
        );
      },
    );
  }
}
