import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.text,
    required this.isCurrentUser,
    required this.author,
  }) : super(key: key);

  final String text;
  final bool isCurrentUser;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isCurrentUser)
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/$author.jpg'),
              ),
            SizedBox(width: 8),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isCurrentUser ? Colors.green : Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: isCurrentUser ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            if (isCurrentUser)
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/$author.jpg'),
              ),
          ],
        ),
      ),
    );
  }
}

class ChatUI extends StatefulWidget {
  const ChatUI({Key? key}) : super(key: key);

  @override
  _ChatUIState createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Hello, how can I help you today?',
      'isCurrentUser': false,
      'author': 'Josie',
    },
    {
      'text':
      'Hi Josie, I\'m having some issues with my tomatoes. The leaves are turning yellow. Do you know what could be the problem?',
      'isCurrentUser': true,
      'author': 'John',
    },
    {
      'text':
      'Hi John, it sounds like lack of nitrogen may be causing the issue. Have you tried feeding them with a nitrogen-rich fertilizer?',
      'isCurrentUser': false,
      'author': 'Josie',
    },
  ];

  final TextEditingController _controller = TextEditingController();

  void _handleSendPressed() {
    final String text = _controller.text;
    _controller.clear();

    setState(() {
      messages.add({
        'text': text,
        'isCurrentUser': true,
        'author': 'John',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with your mentor'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/chat.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> message = messages[index];

                  return ChatBubble(
                    text: message['text'] as String,
                    isCurrentUser: message['isCurrentUser'] as bool,
                    author: message['author'] as String,
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Write a message...',
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _handleSendPressed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
