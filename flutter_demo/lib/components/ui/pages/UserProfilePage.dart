import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo/firebase/firestore.dart';
import 'package:provider/provider.dart';

import '../../../molde/user.dart';
import '../../../provider/UserProvider.dart';

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

  late Future<DocumentSnapshot<Map<String, dynamic>>> _data;

  @override
  void initState() {
    super.initState();
    _data = FirebaseFirestoreService().getFirestoreProfile('123456');
  }

  void init() {}

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: true);
    final User user = userProvider.getUser();
    return FutureBuilder<DocumentSnapshot>(
      future: _data,
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
                          initialValue: user.name,
                          onChanged: (value) => {
                                setState(() {
                                  email = value;
                                })
                              },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: '名前')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          initialValue: user.email,
                          onChanged: (value) => {
                                setState(() {
                                  email = value;
                                })
                              },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'メールアドレス')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          initialValue: user.phoneNumber,
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
                            print(name);
                            await FirebaseFirestoreService()
                                .setFirestoreProile(user.userId, {
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
        return Scaffold(
            body: Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: Colors.green,
                )));
      }),
    );
  }
}
