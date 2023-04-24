import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatBox extends StatefulWidget {
  //final String chatRoomId;
  //final String userId;
  ChatBox(/*this.chatRoomId, this.userId*/);

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  TextEditingController messageController = TextEditingController();
  sendMessage() {
    /*
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sender": widget.userId,
        "time": DateTime.now().millisecondsSinceEpoch,
      };

      FirebaseFirestore.instance
          .collection("chatRooms")
          .doc(widget.chatRoomId)
          .collection("chats")
          .add(messageMap);
      messageController.text = "";
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: "Type a message",
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              sendMessage();
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
