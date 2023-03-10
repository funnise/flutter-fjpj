import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo/firebase/firestore.dart';
import 'package:provider/provider.dart';

import '../../../firebase/index.dart';
import '../../../provider/CounterProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<void> getUserData() async {
  final userDataSnapshot =
      await FirebaseFirestoreService().getFirestoreProfile('123456');
  print(userDataSnapshot.data()!["gender"]);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final CountProvider countProvider =
        Provider.of<CountProvider>(context, listen: true);
    getUserData();
    print(countProvider.getCounter());
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
            ElevatedButton(
                onPressed: () {
                  countProvider.incrementCounter();
                },
                child: Text('追加する')),
          ],
        )),
      ),
    );
  }
}
