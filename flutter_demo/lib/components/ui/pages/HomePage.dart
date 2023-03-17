import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo/firebase/firestore.dart';
import 'package:flutter_demo/molde/user.dart';
import 'package:flutter_demo/provider/UserProvider.dart';
import 'package:provider/provider.dart';

import '../../../firebase/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String _id) async {
  final userDataSnapshot =
      await FirebaseFirestoreService().getFirestoreProfile(_id);
  return userDataSnapshot;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: true);
    print(userProvider.getUserId());
    getUserData(userProvider.getUserId())
        .then((value) => {print(value.id), print(value.data())});
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
            ElevatedButton(onPressed: () {}, child: Text('追加する')),
          ],
        )),
      ),
    );
  }
}
