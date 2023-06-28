import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Notice extends ConsumerWidget {
  const Notice({super.key});

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
          'お知らせ',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          Padding(
            // padding: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              height: 40,
              width: 40,
              child: IconButton(
                icon: const Icon(Icons.settings),
                color: Colors.black,
                splashRadius: 21,
                onPressed: () {},
              ),
            ),
          ),
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
                color: Colors.grey.withOpacity(0.3),
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

      ),
    );
  }
}