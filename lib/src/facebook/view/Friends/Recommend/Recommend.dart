import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Recommend extends ConsumerWidget {
  const Recommend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // デバイスの画面高さを取得
    final double deviceHeight = MediaQuery.of(context).size.height;
    // デバイスの画面幅を取得
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation:0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'おすすめ',
          style: TextStyle(color: Colors.black)
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
            color: Colors.black,
          ),
        ],
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade100,
            width: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            children: [
              // 知り合いかも
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 4.0, left: 14.0, right: 14.0),
                  child: SizedBox(
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '知り合いかも',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    for (int i = 0; i < 30; i++)
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
                              padding: const EdgeInsets.only(top: 4.0, left: 14.0, bottom: 4.0, right: 14.0),
                              // padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Padding(
                                    // padding: EdgeInsets.only(left: 4.0, bottom: 4.0, right: 4.0),
                                    padding: const EdgeInsets.all(4.0),
                                    child: CircleAvatar(
                                      // backgroundColor: Colors.yellow,
                                      backgroundImage: Image.asset('images/羊.png').image,
                                      radius: 45,
                                      // child: Text('AH'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // ユーザー名
                                        const Padding(
                                          padding: EdgeInsets.only(left: 4.0, right: 4.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 4.0),
                                                child: Text(
                                                    'username',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                    )
                                                ),
                                              ),
                                              // Padding(
                                              //   padding: const EdgeInsets.only(bottom: 4.0),
                                              //   child: Text(
                                              //     '17週間',
                                              //     style: TextStyle(
                                              //       color: Colors.grey[400],
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        // 共通の友達がいるか？表示
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                                              child: Stack(
                                                children:[
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 14.0),
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                          backgroundImage: Image.asset('images/ぶた.jpg').image,
                                                          radius: 8,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                        backgroundImage: Image.asset('images/きりん.jpg').image,
                                                        radius: 8,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                                              child: Row(
                                                  children: [
                                                    Text(
                                                      '共通の友達',
                                                      style: TextStyle(
                                                        color: Colors.grey[400],
                                                      ),
                                                    ),
                                                    Text(
                                                      '6',
                                                      style: TextStyle(
                                                        color: Colors.grey[400],
                                                      ),
                                                    ),
                                                    Text(
                                                      '人',
                                                      style: TextStyle(
                                                        color: Colors.grey[400],
                                                      ),
                                                    ),
                                                  ]
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 4.0, right: 2.0),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    foregroundColor: Colors.white,
                                                    backgroundColor: Colors.indigo,
                                                  ),
                                                  child: const Text('友達を追加'),
                                                  onPressed: () {
                                                    // 画面遷移
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(builder: (context) => const Login(title: '',)),
                                                    // );
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
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                // padding: const EdgeInsets.all(4.0),
                                                padding: const EdgeInsets.only(left: 2.0, right: 4.0),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.grey[200],
                                                    foregroundColor: Colors.black,
                                                  ),
                                                  onPressed: () {
                                                    // 画面遷移
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(builder: (context) => const Login(title: '',)),
                                                    // );
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
                                                  child: const Text('削除'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
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
      ),
    );
  }
}
