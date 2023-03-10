import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../firebase/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('チャットページ')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/profile");
                },
                child: Text('プロフィール設定ページ')),
            ElevatedButton(
                onPressed: () {
                  auth.signOut();
                },
                child: Text('ログアウト')),
          ],
        )),
      ),
    );
  }
}
