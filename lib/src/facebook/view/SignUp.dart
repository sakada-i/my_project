import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
// class SignUp extends StatefulWidget {
  String gender = 'man';
  String othername = 'test';

  // @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: Colors.indigo,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Colors.indigo,
                                width: 2.0,
                              ),
                            ),
                            labelText: '姓',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.indigo[300],
                            ),
                            hintText: 'What is your family name',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            floatingLabelStyle: const TextStyle(fontSize: 12),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.indigo[200]!,
                                width: 2.0,
                              )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: Colors.indigo,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Colors.indigo,
                                width: 2.0,
                              ),
                            ),
                            labelText: '名',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.indigo[300],
                            ),
                            hintText: 'What is your name',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            floatingLabelStyle: const TextStyle(fontSize: 12),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.indigo[200]!,
                                width: 2.0,
                              )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField(
                            dropdownColor: Colors.indigo[100],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'man',
                                child: Text('男性'),
                              ),
                              DropdownMenuItem(
                                value: 'woman',
                                child: Text('女性'),
                              ),
                              DropdownMenuItem(
                                value: 'genderless',
                                child: Text('genderless'),
                              ),
                            ],
                            onChanged: (String? value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                            value: gender,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: Colors.indigo,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Colors.indigo,
                                width: 2.0,
                              ),
                            ),
                            labelText: 'メールアドレス',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.indigo[300],
                            ),
                            hintText: 'mailaddress',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            floatingLabelStyle: const TextStyle(fontSize: 12),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.indigo[200]!,
                                width: 2.0,
                              )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: Colors.indigo,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Colors.indigo,
                                width: 2.0,
                              ),
                            ),
                            labelText: '生年月日',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.indigo[300],
                            ),
                            hintText: 'birthday',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            floatingLabelStyle: const TextStyle(fontSize: 12),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.indigo[200]!,
                                width: 2.0,
                              )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(double.maxFinite, 55),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                            ),
                            primary: Colors.indigo,
                          ),
                          onPressed: () {
                          },
                          child: const Text('アカウント登録'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}