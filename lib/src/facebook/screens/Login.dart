// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project/src/facebook/screens/SignUp.dart';

import 'Help.dart';
import 'Home/Home.dart';
import 'OutLine.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  // 入力したメールアドレス・パスワード
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 0.0,
        ),
        backgroundColor: Colors.indigo,
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(60.0),
                  child: Image.asset(
                    'images/sns_facebook.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.people),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          labelText: 'メールアドレス',
                          labelStyle: const TextStyle(
                            fontSize: 12,
                            // color: Colors.indigo[300],
                            color: Colors.white,
                          ),
                          hintText: '半角英数記号で入力して下さい',
                          hintStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          floatingLabelStyle: const TextStyle(fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              // color: Colors.indigo[100]!,
                              color: Colors.white!,
                              width: 1.0,
                            )
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _email = value;
                          });
                        }
                      ),
                    ),
                  /// パスワード入力テキストフィールド
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.key),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          labelText: 'パスワード',
                          labelStyle: const TextStyle(
                            fontSize: 12,
                            // color: Colors.indigo[300],
                            color: Colors.white,
                          ),
                          hintText: '半角英数記号で入力して下さい',
                          hintStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          floatingLabelStyle: const TextStyle(fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                // color: Colors.indigo[100]!,
                                color: Colors.white!,
                                width: 1.0,
                              )
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _password = value;
                          });
                        }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(double.maxFinite, 55),
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const OutLine()),
                          );
                          // 認証 start
                          // try {
                          //   // メール/パスワードでログイン
                          //   final FirebaseAuth auth = FirebaseAuth.instance;
                          //   final UserCredential result = await auth.signInWithEmailAndPassword(
                          //     email: _email,
                          //     password: _password,
                          //   );
                          //   if (result != null) {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(builder: (context) => const Home()),
                          //     );
                          //   }
                          // } catch(e) {
                          //   debugPrint(e as String?);
                          // }
                          // 認証 end
                        },
                        child: const Text('アカウント登録'),
                      ),
                    ),
                  ]
                ),
                Container(
                  margin: const EdgeInsets.all(80),
                  child: Column(
                    children: [
                      /// ユーザー登録リンク
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: const Text(
                          'Facebookに登録',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      /// ヘルプリンク
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Help()),
                          );
                        },
                        child: const Text(
                          'ヘルプが必要な場合',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ]
                  )
                )
              ],
            ),
          )
        )
      ),
    );
  }
}