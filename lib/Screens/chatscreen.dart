import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremi/widgets/Notificationbutton.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30,
              child: Notificationbutton(
                outlinecolor: Colors.black,
                icon: Icons.notifications_outlined,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: [
                ChatBubble(
                  sender: 'Hiremi mentor',
                  message: 'Need any info?',
                  isMe: false,
                  time: "08:15 AM",
                ),
                ChatBubble(
                  sender: 'You',
                  message: 'Can I know about status update?',
                  isMe: true,
                  time: "08:16 AM",
                ),
                ChatBubble(
                  sender: 'Hiremi mentor',
                  message: 'The status has been updated.',
                  isMe: false,
                  time: "08:17 AM",
                ),
                ChatBubble(
                  sender: 'You',
                  message: 'Hello, how are you doing?',
                  isMe: true,
                  time: "08:18 AM",
                ),
                ChatBubble(
                  sender: 'Hiremi mentor',
                  message:
                      "I'm doing well, thank you! How can I help you today?",
                  isMe: false,
                  time: "08:19 AM",
                ),
                ChatBubble(
                  sender: 'You',
                  message:
                      'I have a question about the return policy for a product I purchased.',
                  isMe: true,
                  time: "08:20 AM",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                CircleAvatar(
                  child: Icon(Icons.send),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatefulWidget {
  final String sender;
  final String message;
  final bool isMe;
  final String time;

  ChatBubble(
      {required this.sender,
      required this.message,
      required this.isMe,
      required this.time});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment:
            widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!widget.isMe)
            CircleAvatar(
              radius: 20,
              foregroundImage: AssetImage('assets/jobstatusprofile_3.png'),
            ),
          SizedBox(width: widget.isMe ? 0 : 10),
          Flexible(
            child: Column(
              crossAxisAlignment: widget.isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!widget.isMe)
                  Text(widget.sender,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      )),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7),
                  decoration: BoxDecoration(
                    color: widget.isMe
                        ? Color.fromARGB(255, 1, 116, 200)
                        : Color.fromARGB(255, 144, 200, 241),
                    borderRadius: widget.isMe
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )
                        : const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.message,
                    style: GoogleFonts.sourceSans3(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: widget.isMe ? Colors.white : Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    widget.time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                    textAlign: widget.isMe ? TextAlign.right : TextAlign.left,
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
