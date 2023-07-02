import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Login.dart';

class Notice extends ConsumerWidget {
  const Notice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: [
                    // 新着
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 14.0, right: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '新着',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          // for (int i = 0; i < 3; i++)
                            GestureDetector(
                              onTap:() {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      // title: const Text("タイトル"),
                                      content: const Text("カードをタップしました"),
                                      actions: [
                                        TextButton(
                                          child: const Text("Cancel"),
                                          onPressed: () => Navigator.pop(context),
                                        ),
                                        TextButton(
                                          child: const Text("OK"),
                                          onPressed: () => Navigator.pop(context),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Card(
                                // 影の設定
                                elevation: 0.0,
                                // マージンの設定
                                margin: EdgeInsets.zero,
                                // 角丸をなくす
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                // 背景色
                                color: Colors.cyan[50],
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0, left: 14.0, bottom: 4.0, right: 14.0),
                                          // padding: const EdgeInsets.all(4.0),

                                          child: Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: Colors.lightBlueAccent, width: 2),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(3.0),
                                                  child: CircleAvatar(
                                                    // backgroundColor: Colors.yellow,
                                                    backgroundImage: Image.asset('images/ししまい.png').image,
                                                    radius: 30,
                                                    // child: Text('AH'),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 45.0, top: 40.0),
                                                child: CircleAvatar(
                                                  // backgroundColor: Colors.yellow,
                                                  backgroundImage: Image.asset('images/しか.jpg').image,
                                                  radius: 15,
                                                  // child: Text('AH'),
                                                ),
                                              ),
                                            ],
                                          ),

                                        ),
                                        const Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // お知らせ内容
                                              Text('〇〇〇'),
                                              Text('〇〇〇'),
                                              Text('日付'),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.more_horiz),
                                          iconSize: 35,
                                          splashRadius: 27,
                                          onPressed: () {
                                            // ダイアログの表示
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  // title: const Text("タイトル"),
                                                  content: const Text("ボタンをタップしました"),
                                                  actions: [
                                                    TextButton(
                                                      child: const Text("Cancel"),
                                                      onPressed: () => Navigator.pop(context),
                                                    ),
                                                    TextButton(
                                                      child: const Text("OK"),
                                                      onPressed: () => Navigator.pop(context),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    // 今日
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 14.0, right: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '今日',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          // for (int i = 0; i < 30; i++)
                            GestureDetector(
                              onTap:() {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      // title: const Text("タイトル"),
                                      content: const Text("カードをタップしました"),
                                      actions: [
                                        TextButton(
                                          child: const Text("Cancel"),
                                          onPressed: () => Navigator.pop(context),
                                        ),
                                        TextButton(
                                          child: const Text("OK"),
                                          onPressed: () => Navigator.pop(context),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },

                              // 過去
                              child: Card(
                                // 影の設定
                                elevation: 0.0,
                                // マージンの設定
                                margin: EdgeInsets.zero,
                                // 角丸をなくす
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                // 背景色
                                color: Colors.cyan[50],
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0, left: 14.0, bottom: 4.0, right: 14.0),
                                          // padding: const EdgeInsets.all(4.0),

                                          child: Stack(
                                            children: [
                                              CircleAvatar(
                                                // backgroundColor: Colors.yellow,
                                                backgroundImage: Image.asset('images/ペンギン.jpg').image,
                                                radius: 35,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 45.0, top: 40.0),
                                                child: CircleAvatar(
                                                  // backgroundColor: Colors.yellow,
                                                  backgroundImage: Image.asset('images/しか.jpg').image,
                                                  radius: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // お知らせ内容
                                              Text('〇〇〇'),
                                              Text('〇〇〇'),
                                              Text('日付'),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.more_horiz),
                                          iconSize: 35,
                                          splashRadius: 27,
                                          onPressed: () {
                                            // ダイアログの表示
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  // title: const Text("タイトル"),
                                                  content: const Text("ボタンをタップしました"),
                                                  actions: [
                                                    TextButton(
                                                      child: const Text("Cancel"),
                                                      onPressed: () => Navigator.pop(context),
                                                    ),
                                                    TextButton(
                                                      child: const Text("OK"),
                                                      onPressed: () => Navigator.pop(context),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 14.0, right: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '過去',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          // for (int i = 0; i < 30; i++)
                            GestureDetector(
                              onTap:() {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      // title: const Text("タイトル"),
                                      content: const Text("カードをタップしました"),
                                      actions: [
                                        TextButton(
                                          child: const Text("Cancel"),
                                          onPressed: () => Navigator.pop(context),
                                        ),
                                        TextButton(
                                          child: const Text("OK"),
                                          onPressed: () => Navigator.pop(context),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Card(
                                // 影の設定
                                elevation: 0.0,
                                // マージンの設定
                                margin: EdgeInsets.zero,
                                // 角丸をなくす
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                // 背景色
                                color: Colors.white,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0, left: 14.0, bottom: 4.0, right: 14.0),
                                          // padding: const EdgeInsets.all(4.0),

                                          child: Stack(
                                            children: [
                                              CircleAvatar(
                                                // backgroundColor: Colors.yellow,
                                                backgroundImage: Image.asset('images/ぶた.jpg').image,
                                                radius: 35,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 45.0, top: 40.0),
                                                child: CircleAvatar(
                                                  // backgroundColor: Colors.yellow,
                                                  backgroundImage: Image.asset('images/くま.jpg').image,
                                                  radius: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // お知らせ内容
                                              Text('〇〇〇'),
                                              Text('〇〇〇'),
                                              Text('日付'),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.more_horiz),
                                          iconSize: 35,
                                          splashRadius: 27,
                                          onPressed: () {
                                            // ダイアログの表示
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  // title: const Text("タイトル"),
                                                  content: const Text("ボタンをタップしました"),
                                                  actions: [
                                                    TextButton(
                                                      child: const Text("Cancel"),
                                                      onPressed: () => Navigator.pop(context),
                                                    ),
                                                    TextButton(
                                                      child: const Text("OK"),
                                                      onPressed: () => Navigator.pop(context),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
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

            ]),
          ),
        ],
      ),



      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   // 戻るボタンの可否
      //   automaticallyImplyLeading: false,
      //   // 下線の非表示
      //   elevation: 0.0,
      //   title: const Text(
      //     'お知らせ',
      //     style: TextStyle(
      //       fontSize: 30,
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   actions: <Widget>[
      //     Padding(
      //       // padding: const EdgeInsets.all(4.0),
      //       padding: const EdgeInsets.all(4.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           color: Colors.grey[200],
      //         ),
      //         height: 40,
      //         width: 40,
      //         child: IconButton(
      //           icon: const Icon(Icons.settings),
      //           color: Colors.black,
      //           splashRadius: 21,
      //           onPressed: () {},
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(
      //         top: 4.0,
      //         left: 4.0,
      //         bottom: 4.0,
      //         right: 8.0
      //       ),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           color: Colors.grey.withOpacity(0.3),
      //         ),
      //         height: 40,
      //         width: 40,
      //         child: IconButton(
      //           icon: const Icon(Icons.search),
      //           color: Colors.black,
      //           splashRadius: 21,
      //           onPressed: () {
      //           },
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // body: Container(
      //   color: Colors.white,
      //
      // ),
    );
  }
}