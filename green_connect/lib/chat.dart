import 'package:flutter/material.dart';

// A custom widget class to represent a chat bubble
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
      // add some padding
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Align(
        // align the child within the container
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isCurrentUser)
              CircleAvatar(
                // display the author's profile picture
                backgroundImage: AssetImage('assets/images/$author.jpg'),
              ),
            SizedBox(width: 8),
            Expanded(
              child: DecoratedBox(
                // chat bubble decoration
                decoration: BoxDecoration(
                  color: isCurrentUser ? Colors.blue : Colors.grey[300],
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
                // display the author's profile picture
                backgroundImage: AssetImage('assets/images/$author.jpg'),
              ),
          ],
        ),
      ),
    );
  }
}

// A custom widget class to represent the chat UI
class ChatUI extends StatefulWidget {
  const ChatUI({Key? key}) : super(key: key);

  @override
  _ChatUIState createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  // A list of sample chat messages
  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Hello, how can I help you today?',
      'isCurrentUser': false,
      'author': 'Josie',
    },
    {
      'text': 'Hi Josie, I\'m having some issues with my tomatoes. The leaves are turning yellow. Do you know what could be the problem?',
      'isCurrentUser': true,
      'author': 'John',
    },
    {
      'text': 'Hi John, it sounds like lack of nitrogen may be causing the issue. Have you tried feeding them with a nitrogen-rich fertilizer?',
      'isCurrentUser': false,
      'author': 'Josie',
    },
  ];

  // A controller for the text input field
  final TextEditingController _controller = TextEditingController();

  // A method to handle the send button press
  void _handleSendPressed() {
    // Get the text from the controller
    final String text = _controller.text;

    // Clear the controller
    _controller.clear();

    // Add a new message to the list
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
        // display the chat title
        title: Text('Chat with your mentor'),
      ),
      body: Column(
        children: [
          Expanded(
            // display the chat messages in a list view
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                // Get the message data
                final Map<String, dynamic> message = messages[index];

                // Return a chat bubble widget
                return ChatBubble(
                  text: message['text'] as String,
                  isCurrentUser: message['isCurrentUser'] as bool,
                  author: message['author'] as String,
                );
              },
            ),
          ),
          // display the text input field and the send button
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Write a message...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.attach_file),
                onPressed: () {
                  // TODO: handle the attachment button press
                },
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _handleSendPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
