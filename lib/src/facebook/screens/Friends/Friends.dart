import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Login.dart';

class Friends extends ConsumerWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // 戻るボタンの可否
        automaticallyImplyLeading: false,
        // 下線の非表示
        elevation: 0.0,
        title: const Text(
          '友達',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          // 検索ロゴ
          Padding(
            padding: const EdgeInsets.only(
              top: 4.0,
              left: 4.0,
              bottom: 4.0,
              right: 8.0
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              height: 40,
              width: 40,
              child: IconButton(
                icon: const Icon(Icons.search),
                color: Colors.black,
                splashRadius: 21,
                onPressed: () {
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: const Border(
                    bottom: BorderSide(),
                  ),
                  color: Colors.yellow[100],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                          shape: const StadiumBorder(),
                          elevation: 0.0,
                        ),
                        onPressed: () {},
                        child: const Text('おすすめ'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                          shape: const StadiumBorder(),
                          elevation: 0.0,
                        ),
                        onPressed: () {},
                        child: const Text('友達'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: const Border(
                    bottom: BorderSide(),
                  ),
                  color: Colors.blue[100],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '友達リクエスト',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed:() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Login(title: '',)),
                              );
                            },
                            child: const Text('すべて見る'),
                          ),
                        ],
                      ),
                    ),
                    for (int i = 0; i < 3; i++)
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Card(
                          child: SizedBox(
                            width: double.infinity,
                            height: 100,
                            child: ListTile(
                              dense: true,
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('images/きりん.jpg'),
                              ),
                              title: Text('ddd'),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}