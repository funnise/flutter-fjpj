// ignore_for_file: empty_statements

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FriendListPage extends StatefulWidget {
  const FriendListPage({super.key});

  @override
  State<FriendListPage> createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  List<Friend> _friendList = [
    Friend(
        name: 'まほ',
        message: 'ヤッホー今日暇？？',
        imageUrl:
            'https://bishoujo-zukan.jp/archives/001/202105/5ff9f8b3591145908b705cf0c320a9d6.jpg'),
    Friend(
        name: 'さやか',
        message: '昨日は楽しかったね！！また飲みに行こう！！',
        imageUrl:
            'https://bishoujo-zukan.jp/archives/001/202007/e71d2873ba1ac642fd8206880be15596.jpg'),
    Friend(
        name: '杏子',
        message: 'ねぇ、返事してよ',
        imageUrl:
            'https://bishoujo-zukan.jp/archives/001/202007/f87b6425c70e143b408184834d976e0c.jpg'),
    Friend(
        name: 'まほ',
        message: 'ヤッホー今日暇？？',
        imageUrl:
            'https://bishoujo-zukan.jp/archives/001/202105/5ff9f8b3591145908b705cf0c320a9d6.jpg'),
    Friend(
        name: 'さやか',
        message: '昨日は楽しかったね！！また飲みに行こう！！',
        imageUrl:
            'https://bishoujo-zukan.jp/archives/001/202007/e71d2873ba1ac642fd8206880be15596.jpg'),
    Friend(
        name: '杏子',
        message: 'ねぇ、返事してよ',
        imageUrl:
            'https://bishoujo-zukan.jp/archives/001/202007/f87b6425c70e143b408184834d976e0c.jpg'),
    Friend(
        name: 'まほ',
        message: 'ヤッホー今日暇？？',
        imageUrl:
            'https://bishoujo-zukan.jp/archives/001/202105/5ff9f8b3591145908b705cf0c320a9d6.jpg'),
    Friend(
        name: 'さやか',
        message: '昨日は楽しかったね！！また飲みに行こう！！',
        imageUrl:
            'https://bishoujo-zukan.jp/archives/001/202007/e71d2873ba1ac642fd8206880be15596.jpg'),
    Friend(
        name: '杏子',
        message: 'ねぇ、返事してよ',
        imageUrl:
            'https://bishoujo-zukan.jp/archives/001/202007/f87b6425c70e143b408184834d976e0c.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'チャット一覧',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: _friendList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Card(
                  child: ListTile(
                leading: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(_friendList[index].imageUrl)),
                title: Text(
                  _friendList[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(_friendList[index].message),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('2:30 PM'),
                    SizedBox(height: 5.0),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 7.0,
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("/chat", arguments: {
                    'name': _friendList[index].name,
                  });
                },
              )),
            );
          }),
    );
  }
}

class Friend {
  final String name;
  final String message;
  final String imageUrl;
  // final String lastMessageTime;
  Friend({
    required this.name,
    required this.message,
    required this.imageUrl,
    /*required this.lastMessageTime*/
  });
}
