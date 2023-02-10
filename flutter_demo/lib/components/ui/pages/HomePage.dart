import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text('チャットページ')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/profile");
              },
              child: Text('プロフィール設定ページ')),
        ],
      )),
    );
  }
}
