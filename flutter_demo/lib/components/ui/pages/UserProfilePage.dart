import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestoreService().getFirestoreProfile('123456'),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print(data['email']);
          print(data['name']);
          print(data['phoneNumber']);
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
                          initialValue: data['name'],
                          onChanged: (value) => {
                                setState(() {
                                  name = value;
                                })
                              },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '名前を入力してください')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          initialValue: data['email'],
                          onChanged: (value) => {
                                setState(() {
                                  email = value;
                                })
                              },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'メールアドレス')),
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
                          initialValue: data['phoneNumber'],
                          onChanged: (value) => {
                                setState(() {
                                  phoneNumber = value;
                                })
                              },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: '電話番号')),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: ElevatedButton(
                          child: Text('更新する'),
                          onPressed: () async {
                            await FirebaseFirestoreService()
                                .setFirestoreProile('123456', {
                                  "email": email,
                                  "phoneNumber": phoneNumber,
                                  "name": name,
                                  "gender": isMan ? "man" : "woman",
                                  "updateAt": Timestamp.now()
                                })
                                .then((value) => {
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
                                    })
                                .catchError((onError) {
                                  print(onError);
                                  setState(() {
                                    final snackBar = SnackBar(
                                      content: const Text('書き込みに失敗しました'),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {
                                          // Some code to undo the change.
                                        },
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  });
                                });
                          },
                        ),
                      ),
                    )
                  ]),
            )),
          );
        }
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              color: Colors.green,
            ));
      }),
    );
  }
}
