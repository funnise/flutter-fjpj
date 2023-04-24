import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../molecules/ChatBox.dart';
import '../molecules/ChatRoom.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ChatRoomWidget(
                    profileImageUrl:
                        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.oricon.co.jp%2Fphoto%2F4320%2F195233%2F&psig=AOvVaw3P8BNQyu2yhIQESfu5icTl&ust=1680934806388000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMC08qGQl_4CFQAAAAAdAAAAABAF",
                    name: "test",
                    message: "こんにちは。こんにちは。こんにちは",
                    time: "2023/03/22",
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ChatBox(),
            )
          ],
        ),
      ),
    );
  }
}
