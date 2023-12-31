import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

import '../Login.dart';
import 'FriendsList/FriendsList.dart';
import 'Recommend/Recommend.dart';

class Friends extends ConsumerWidget {
  const Friends({super.key});

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
              '友達',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            actions: <Widget>[
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
            ],

          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        // border: Border(
                        //   bottom: BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, left: 14, bottom: 4.0, right: 4.0),
                            // padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[200],
                                foregroundColor: Colors.black,
                                shape: const StadiumBorder(),
                                elevation: 0.0,
                              ),
                              onPressed: () {
                                // 画面遷移
                                Navigator.push(
                                  context,
                                  // MaterialPageRoute(builder: (context) => const Recommend()),
                                  PageTransition(
                                    child: const Recommend(), //画面遷移先
                                    type: PageTransitionType.rightToLeft,
                                    //アニメーションの時間
                                    duration: const Duration(milliseconds: 400),
                                    //戻る際のアニメーションの時間
                                    reverseDuration: const Duration(milliseconds: 400),
                                  ),
                                );
                              },
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
                              child: const Text('友達'),
                              onPressed: () {
                                // 画面遷移
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const FriendsList()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// 区切り線
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      // height: 50,
                      indent: 20,
                      endIndent: 20,
                    ),

                    // 友達リクエスト
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 14.0, right: 14.0),
                        child: SizedBox(
                          height: 48.0,
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
                                  // 画面遷移
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => const Login(title: '',)),
                                  // );
                                  // ダイアログを表示する
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
                                child: const Text('すべて見る'),
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
                          for (int i = 0; i < 3; i++)
                            GestureDetector(
                              onTap:() {
                                // ダイアログを表示する
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
                                // 影をつける
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
                                            backgroundImage: Image.asset('images/ししまい.png').image,
                                            radius: 45,
                                            // child: Text('AH'),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // ユーザー名
                                              Padding(
                                                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(bottom: 4.0),
                                                      child: Text(
                                                          'username',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                          )
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom: 4.0),
                                                      child: Text(
                                                        '17週間',
                                                        style: TextStyle(
                                                          color: Colors.grey[400],
                                                        ),
                                                      ),
                                                    ),
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
                                                                backgroundImage: Image.asset('images/ペンギン.jpg').image,
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
                                                              backgroundImage: Image.asset('images/アザラシ.jpg').image,
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
                                                        child: const Text('承認'),
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
                          // const Padding(
                          //   padding: EdgeInsets.all(4.0),
                          //   child: SizedBox(
                          //     width: double.infinity,
                          //     height: 100,
                          //     child: ListTile(
                          //       // dense: true,
                          //       leading: CircleAvatar(
                          //         // backgroundImage: AssetImage('images/くま.jpg'),
                          //         backgroundColor: Colors.yellow,
                          //         child: Text('AH'),
                          //       ),
                          //       title: Text('ddd'),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    
                    /// 区切り線
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      // height: 50,
                      indent: 20,
                      endIndent: 20,
                    ),

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
      //     '友達',
      //     style: TextStyle(
      //       fontSize: 30,
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   actions: <Widget>[
      //     // 検索ロゴ
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
      //           color: Colors.grey[200],
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
      //   width: double.infinity,
      //   child: Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: Column(
      //       children: [
      //         Container(
      //           decoration: BoxDecoration(
      //             border: const Border(
      //               bottom: BorderSide(
      //                 color: Colors.grey,
      //               ),
      //             ),
      //             color: Colors.yellow[100],
      //           ),
      //           child: Row(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.all(4.0),
      //                 child: ElevatedButton(
      //                   style: ElevatedButton.styleFrom(
      //                     backgroundColor: Colors.grey[200],
      //                     foregroundColor: Colors.black,
      //                     shape: const StadiumBorder(),
      //                     elevation: 0.0,
      //                   ),
      //                   onPressed: () {
      //                     // ダイアログの表示
      //                     showDialog(
      //                       context: context,
      //                       builder: (context) {
      //                         return AlertDialog(
      //                           // title: const Text("タイトル"),
      //                           content: const Text("ボタンをタップしました"),
      //                           actions: [
      //                             TextButton(
      //                               child: const Text("Cancel"),
      //                               onPressed: () => Navigator.pop(context),
      //                             ),
      //                             TextButton(
      //                               child: const Text("OK"),
      //                               onPressed: () => Navigator.pop(context),
      //                             ),
      //                           ],
      //                         );
      //                       },
      //                     );
      //                   },
      //                   child: const Text('おすすめ'),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.all(4.0),
      //                 child: ElevatedButton(
      //                   style: ElevatedButton.styleFrom(
      //                     backgroundColor: Colors.grey[200],
      //                     foregroundColor: Colors.black,
      //                     shape: const StadiumBorder(),
      //                     elevation: 0.0,
      //                   ),
      //                   child: const Text('友達'),
      //                   onPressed: () {
      //                     // ダイアログの表示
      //                     showDialog(
      //                       context: context,
      //                       builder: (context) {
      //                         return AlertDialog(
      //                           // title: const Text("タイトル"),
      //                           content: const Text("ボタンをタップしました"),
      //                           actions: [
      //                             TextButton(
      //                               child: const Text("Cancel"),
      //                               onPressed: () => Navigator.pop(context),
      //                             ),
      //                             TextButton(
      //                               child: const Text("OK"),
      //                               onPressed: () => Navigator.pop(context),
      //                             ),
      //                           ],
      //                         );
      //                       },
      //                     );
      //                   },
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         // 友達リクエスト
      //         Container(
      //           width: double.infinity,
      //           decoration: const BoxDecoration(
      //             border: Border(
      //               bottom: BorderSide(
      //                 color: Colors.grey,
      //               ),
      //             ),
      //           ),
      //           child: Column(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
      //                 child: SizedBox(
      //                   height: 48.0,
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       const Text(
      //                         '友達リクエスト',
      //                         style: TextStyle(
      //                           fontSize: 20,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                       TextButton(
      //                         onPressed:() {
      //                           Navigator.push(
      //                             context,
      //                             MaterialPageRoute(builder: (context) => const Login(title: '',)),
      //                           );
      //                         },
      //                         child: const Text('すべて見る'),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               for (int i = 0; i < 3; i++)
      //               GestureDetector(
      //                 onTap:() {
      //                   showDialog(
      //                     context: context,
      //                     builder: (context) {
      //                       return AlertDialog(
      //                         // title: const Text("タイトル"),
      //                         content: const Text("カードをタップしました"),
      //                         actions: [
      //                           TextButton(
      //                             child: const Text("Cancel"),
      //                             onPressed: () => Navigator.pop(context),
      //                           ),
      //                           TextButton(
      //                             child: const Text("OK"),
      //                             onPressed: () => Navigator.pop(context),
      //                           ),
      //                         ],
      //                       );
      //                     },
      //                   );
      //                 },
      //                 child: Card(
      //                   // 影をつける
      //                   // elevation: 4.0,
      //                   // 背景色
      //                   color: Colors.cyan[50],
      //                   child: SizedBox(
      //                     width: double.infinity,
      //                     child: Row(
      //                       children: [
      //                         Padding(
      //                           // padding: EdgeInsets.only(left: 4.0, bottom: 4.0, right: 4.0),
      //                           padding: const EdgeInsets.all(4.0),
      //                           child: CircleAvatar(
      //                             // backgroundColor: Colors.yellow,
      //                             backgroundImage: Image.asset('images/ししまい.png').image,
      //                             radius: 45,
      //                             // child: Text('AH'),
      //                           ),
      //                         ),
      //                         Expanded(
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               // ユーザー名
      //                               Padding(
      //                                 padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      //                                 child: Row(
      //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                   children: [
      //                                     const Padding(
      //                                       padding: EdgeInsets.only(bottom: 4.0),
      //                                       child: Text(
      //                                         'username',
      //                                         style: TextStyle(
      //                                           fontSize: 18,
      //                                           fontWeight: FontWeight.bold,
      //                                         )
      //                                       ),
      //                                     ),
      //                                     Padding(
      //                                       padding: const EdgeInsets.only(bottom: 4.0),
      //                                       child: Text(
      //                                         '17週間',
      //                                         style: TextStyle(
      //                                           color: Colors.grey[400],
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ),
      //                               // 共通の友達がいるか？表示
      //                               Row(
      //                                 children: [
      //                                   Padding(
      //                                     padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      //                                     child: Stack(
      //                                       children:[
      //                                         Padding(
      //                                           padding: const EdgeInsets.only(left: 14.0),
      //                                           child: Container(
      //                                             decoration: const BoxDecoration(
      //                                               color: Colors.white,
      //                                               shape: BoxShape.circle,
      //                                             ),
      //                                             child: Padding(
      //                                               padding: const EdgeInsets.all(1.0),
      //                                               child: CircleAvatar(
      //                                                 backgroundImage: Image.asset('images/ペンギン.jpg').image,
      //                                                 radius: 8,
      //                                               ),
      //                                             ),
      //                                           ),
      //                                         ),
      //                                         Container(
      //                                           decoration: const BoxDecoration(
      //                                             color: Colors.white,
      //                                             shape: BoxShape.circle,
      //                                           ),
      //                                           child: Padding(
      //                                             padding: const EdgeInsets.all(1.0),
      //                                             child: CircleAvatar(
      //                                               backgroundImage: Image.asset('images/アザラシ.jpg').image,
      //                                               radius: 8,
      //                                             ),
      //                                           ),
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ),
      //                                   Padding(
      //                                     padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      //                                     child: Row(
      //                                       children: [
      //                                         Text(
      //                                           '共通の友達',
      //                                           style: TextStyle(
      //                                             color: Colors.grey[400],
      //                                           ),
      //                                         ),
      //                                         Text(
      //                                           '6',
      //                                           style: TextStyle(
      //                                             color: Colors.grey[400],
      //                                           ),
      //                                         ),
      //                                         Text(
      //                                           '人',
      //                                           style: TextStyle(
      //                                             color: Colors.grey[400],
      //                                           ),
      //                                         ),
      //                                       ]
      //                                     ),
      //                                   )
      //                                 ],
      //                               ),
      //                               Row(
      //                                 children: [
      //                                   Expanded(
      //                                     child: Padding(
      //                                       padding: const EdgeInsets.only(left: 4.0, right: 2.0),
      //                                       child: ElevatedButton(
      //                                         style: ElevatedButton.styleFrom(
      //                                           foregroundColor: Colors.white,
      //                                           backgroundColor: Colors.indigo,
      //                                         ),
      //                                         child: const Text('承認'),
      //                                         onPressed: () {
      //                                           // 画面遷移
      //                                           // Navigator.push(
      //                                           //   context,
      //                                           //   MaterialPageRoute(builder: (context) => const Login(title: '',)),
      //                                           // );
      //                                           // ダイアログの表示
      //                                           showDialog(
      //                                             context: context,
      //                                             builder: (context) {
      //                                               return AlertDialog(
      //                                                 // title: const Text("タイトル"),
      //                                                 content: const Text("ボタンをタップしました"),
      //                                                 actions: [
      //                                                   TextButton(
      //                                                     child: const Text("Cancel"),
      //                                                     onPressed: () => Navigator.pop(context),
      //                                                   ),
      //                                                   TextButton(
      //                                                     child: const Text("OK"),
      //                                                     onPressed: () => Navigator.pop(context),
      //                                                   ),
      //                                                 ],
      //                                               );
      //                                             },
      //                                           );
      //                                         },
      //                                       ),
      //                                     ),
      //                                   ),
      //                                   Expanded(
      //                                     child: Padding(
      //                                       // padding: const EdgeInsets.all(4.0),
      //                                       padding: const EdgeInsets.only(left: 2.0, right: 4.0),
      //                                       child: ElevatedButton(
      //                                         style: ElevatedButton.styleFrom(
      //                                           backgroundColor: Colors.grey[200],
      //                                           foregroundColor: Colors.black,
      //                                         ),
      //                                         onPressed: () {
      //                                           // 画面遷移
      //                                           // Navigator.push(
      //                                           //   context,
      //                                           //   MaterialPageRoute(builder: (context) => const Login(title: '',)),
      //                                           // );
      //                                           // ダイアログの表示
      //                                           showDialog(
      //                                             context: context,
      //                                             builder: (context) {
      //                                               return AlertDialog(
      //                                                 // title: const Text("タイトル"),
      //                                                 content: const Text("ボタンをタップしました"),
      //                                                 actions: [
      //                                                   TextButton(
      //                                                     child: const Text("Cancel"),
      //                                                     onPressed: () => Navigator.pop(context),
      //                                                   ),
      //                                                   TextButton(
      //                                                     child: const Text("OK"),
      //                                                     onPressed: () => Navigator.pop(context),
      //                                                   ),
      //                                                 ],
      //                                               );
      //                                             },
      //                                           );
      //                                         },
      //                                         child: const Text('削除'),
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ],
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               // const Padding(
      //               //   padding: EdgeInsets.all(4.0),
      //               //   child: SizedBox(
      //               //     width: double.infinity,
      //               //     height: 100,
      //               //     child: ListTile(
      //               //       // dense: true,
      //               //       leading: CircleAvatar(
      //               //         // backgroundImage: AssetImage('images/くま.jpg'),
      //               //         backgroundColor: Colors.yellow,
      //               //         child: Text('AH'),
      //               //       ),
      //               //       title: Text('ddd'),
      //               //     ),
      //               //   ),
      //               // ),
      //             ],
      //           ),
      //         ),
      //
      //         // 知り合いかも
      //         SizedBox(
      //           width: double.infinity,
      //           // decoration: const BoxDecoration(
      //           //   border: Border(
      //           //     bottom: BorderSide(
      //           //       color: Colors.grey,
      //           //     ),
      //           //   ),
      //           // ),
      //           child: Column(
      //             children: [
      //               const Padding(
      //                 padding: EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
      //                 child: SizedBox(
      //                   height: 48,
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text(
      //                         '知り合いかも',
      //                         style: TextStyle(
      //                           fontSize: 20,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               for (int i = 0; i < 30; i++)
      //               GestureDetector(
      //                 onTap:() {
      //                   showDialog(
      //                     context: context,
      //                     builder: (context) {
      //                       return AlertDialog(
      //                         // title: const Text("タイトル"),
      //                         content: const Text("カードをタップしました"),
      //                         actions: [
      //                           TextButton(
      //                             child: const Text("Cancel"),
      //                             onPressed: () => Navigator.pop(context),
      //                           ),
      //                           TextButton(
      //                             child: const Text("OK"),
      //                             onPressed: () => Navigator.pop(context),
      //                           ),
      //                         ],
      //                       );
      //                     },
      //                   );
      //                 },
      //                 child: Card(
      //                   // 影をつける
      //                   // elevation: 4.0,
      //                   // 背景色
      //                   color: Colors.cyan[50],
      //                   child: SizedBox(
      //                     width: double.infinity,
      //                     child: Row(
      //                       children: [
      //                         Padding(
      //                           // padding: EdgeInsets.only(left: 4.0, bottom: 4.0, right: 4.0),
      //                           padding: const EdgeInsets.all(4.0),
      //                           child: CircleAvatar(
      //                             // backgroundColor: Colors.yellow,
      //                             backgroundImage: Image.asset('images/羊.png').image,
      //                             radius: 45,
      //                             // child: Text('AH'),
      //                           ),
      //                         ),
      //                         Expanded(
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               // ユーザー名
      //                               const Padding(
      //                                 padding: EdgeInsets.only(left: 4.0, right: 4.0),
      //                                 child: Row(
      //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                   children: [
      //                                     Padding(
      //                                       padding: EdgeInsets.only(bottom: 4.0),
      //                                       child: Text(
      //                                           'username',
      //                                           style: TextStyle(
      //                                             fontSize: 18,
      //                                             fontWeight: FontWeight.bold,
      //                                           )
      //                                       ),
      //                                     ),
      //                                     // Padding(
      //                                     //   padding: const EdgeInsets.only(bottom: 4.0),
      //                                     //   child: Text(
      //                                     //     '17週間',
      //                                     //     style: TextStyle(
      //                                     //       color: Colors.grey[400],
      //                                     //     ),
      //                                     //   ),
      //                                     // ),
      //                                   ],
      //                                 ),
      //                               ),
      //                               // 共通の友達がいるか？表示
      //                               Row(
      //                                 children: [
      //                                   Padding(
      //                                     padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      //                                     child: Stack(
      //                                       children:[
      //                                         Padding(
      //                                           padding: const EdgeInsets.only(left: 14.0),
      //                                           child: Container(
      //                                             decoration: const BoxDecoration(
      //                                               color: Colors.white,
      //                                               shape: BoxShape.circle,
      //                                             ),
      //                                             child: Padding(
      //                                               padding: const EdgeInsets.all(1.0),
      //                                               child: CircleAvatar(
      //                                                 backgroundImage: Image.asset('images/ぶた.jpg').image,
      //                                                 radius: 8,
      //                                               ),
      //                                             ),
      //                                           ),
      //                                         ),
      //                                         Container(
      //                                           decoration: const BoxDecoration(
      //                                             color: Colors.white,
      //                                             shape: BoxShape.circle,
      //                                           ),
      //                                           child: Padding(
      //                                             padding: const EdgeInsets.all(1.0),
      //                                             child: CircleAvatar(
      //                                               backgroundImage: Image.asset('images/きりん.jpg').image,
      //                                               radius: 8,
      //                                             ),
      //                                           ),
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ),
      //                                   Padding(
      //                                     padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      //                                     child: Row(
      //                                         children: [
      //                                           Text(
      //                                             '共通の友達',
      //                                             style: TextStyle(
      //                                               color: Colors.grey[400],
      //                                             ),
      //                                           ),
      //                                           Text(
      //                                             '6',
      //                                             style: TextStyle(
      //                                               color: Colors.grey[400],
      //                                             ),
      //                                           ),
      //                                           Text(
      //                                             '人',
      //                                             style: TextStyle(
      //                                               color: Colors.grey[400],
      //                                             ),
      //                                           ),
      //                                         ]
      //                                     ),
      //                                   )
      //                                 ],
      //                               ),
      //                               Row(
      //                                 children: [
      //                                   Expanded(
      //                                     child: Padding(
      //                                       padding: const EdgeInsets.only(left: 4.0, right: 2.0),
      //                                       child: ElevatedButton(
      //                                         style: ElevatedButton.styleFrom(
      //                                           foregroundColor: Colors.white,
      //                                           backgroundColor: Colors.indigo,
      //                                         ),
      //                                         child: const Text('友達を追加'),
      //                                         onPressed: () {
      //                                           // 画面遷移
      //                                           // Navigator.push(
      //                                           //   context,
      //                                           //   MaterialPageRoute(builder: (context) => const Login(title: '',)),
      //                                           // );
      //                                           // ダイアログの表示
      //                                           showDialog(
      //                                             context: context,
      //                                             builder: (context) {
      //                                               return AlertDialog(
      //                                                 // title: const Text("タイトル"),
      //                                                 content: const Text("ボタンをタップしました"),
      //                                                 actions: [
      //                                                   TextButton(
      //                                                     child: const Text("Cancel"),
      //                                                     onPressed: () => Navigator.pop(context),
      //                                                   ),
      //                                                   TextButton(
      //                                                     child: const Text("OK"),
      //                                                     onPressed: () => Navigator.pop(context),
      //                                                   ),
      //                                                 ],
      //                                               );
      //                                             },
      //                                           );
      //                                         },
      //                                       ),
      //                                     ),
      //                                   ),
      //                                   Expanded(
      //                                     child: Padding(
      //                                       // padding: const EdgeInsets.all(4.0),
      //                                       padding: const EdgeInsets.only(left: 2.0, right: 4.0),
      //                                       child: ElevatedButton(
      //                                         style: ElevatedButton.styleFrom(
      //                                           backgroundColor: Colors.grey[200],
      //                                           foregroundColor: Colors.black,
      //                                         ),
      //                                         onPressed: () {
      //                                           // 画面遷移
      //                                           // Navigator.push(
      //                                           //   context,
      //                                           //   MaterialPageRoute(builder: (context) => const Login(title: '',)),
      //                                           // );
      //                                           // ダイアログの表示
      //                                           showDialog(
      //                                             context: context,
      //                                             builder: (context) {
      //                                               return AlertDialog(
      //                                                 // title: const Text("タイトル"),
      //                                                 content: const Text("ボタンをタップしました"),
      //                                                 actions: [
      //                                                   TextButton(
      //                                                     child: const Text("Cancel"),
      //                                                     onPressed: () => Navigator.pop(context),
      //                                                   ),
      //                                                   TextButton(
      //                                                     child: const Text("OK"),
      //                                                     onPressed: () => Navigator.pop(context),
      //                                                   ),
      //                                                 ],
      //                                               );
      //                                             },
      //                                           );
      //                                         },
      //                                         child: const Text('削除'),
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ],
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               // const Padding(
      //               //   padding: EdgeInsets.all(4.0),
      //               //   child: SizedBox(
      //               //     width: double.infinity,
      //               //     height: 100,
      //               //     child: ListTile(
      //               //       // dense: true,
      //               //       leading: CircleAvatar(
      //               //         // backgroundImage: AssetImage('images/くま.jpg'),
      //               //         backgroundColor: Colors.yellow,
      //               //         child: Text('AH'),
      //               //       ),
      //               //       title: Text('ddd'),
      //               //     ),
      //               //   ),
      //               // ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}