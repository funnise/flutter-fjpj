import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo/firebase/firestore.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool isMan = false;
  String email = "";
  String name = "";
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '名前を入力してください')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'メールアドレス')),
              ),
              SwitchListTile(
                title: const Text('性別'),
                value: isMan,
                onChanged: (bool value) {
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: '電話番号')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    child: Text('更新する'),
                    onPressed: () async {
                      await FirebaseFirestore().setFirestoreProile('12345', {
                        "email": email,
                        "phoneNumber": phoneNumber,
                        "name": name,
                        "gender": isMan ? "man" : "woman"
                      }).then((value) => {
                            setState(() {
                              final snackBar = SnackBar(
                                content: const Text('書き込みが完了しました'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }),
                          });
                    },
                  ),
                ),
              )
            ]),
      )),
    );
  }
}
