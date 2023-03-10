import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_demo/firebase/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;
  String email = '';
  String password = '';
  String infoText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                onChanged: ((String value) {
                  setState(() {
                    email = value;
                  });
                }),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'emailアドレスを入力してください'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                obscureText: isObscure,
                decoration: InputDecoration(
                    labelText: 'パスワードを入力してください',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    )),
                onChanged: ((String value) {
                  setState(() {
                    password = value;
                  });
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                  child: ElevatedButton(
                      onPressed: (() async {
                        try {
                          await FirebaseAuthService()
                              .createUserWithEmailAndPassword(email, password)
                              .then((value) => {
                                    setState(
                                      () {
                                        final snackBar = SnackBar(
                                          content: const Text('ユーザー登録が完了しました'),
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              // Some code to undo the change.
                                            },
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                    )
                                  });
                        } catch (e) {
                          // ユーザー登録に失敗した場合
                          setState(() {
                            infoText = "登録に失敗しました：${e.toString()}";
                          });
                        }
                      }),
                      child: Text('ユーザ登録'))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                  child: ElevatedButton(
                      onPressed: (() async {
                        try {
                          // メール/パスワードでユーザー登録
                          FirebaseAuthService()
                              .signInWithEmailAndPassword(email, password)
                              .then((value) => {
                                    setState(() {
                                      final snackBar = SnackBar(
                                        content: const Text('ログイン成功'),
                                        action: SnackBarAction(
                                          label: 'Undo',
                                          onPressed: () {
                                            // Some code to undo the change.
                                          },
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    })
                                  });
                        } catch (e) {
                          // ユーザー登録に失敗した場合
                          setState(() {
                            infoText = "登録に失敗しました：${e.toString()}";
                          });
                        }
                      }),
                      child: Text('ログイン'))),
            ),
            Container(
              padding: EdgeInsets.all(8),
              // メッセージ表示
              child: Text(infoText),
            ),
          ],
        ),
      )),
    );
  }
}
