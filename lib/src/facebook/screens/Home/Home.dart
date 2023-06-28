import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Login.dart';

class Home extends StatefulWidget implements PreferredSizeWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HomeState extends State<Home> {

  String orderDocumentInfo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: const Text(
              'facebook',
              style: TextStyle(
                fontSize: 30,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              // 新規投稿ロゴ
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  height: 40,
                  width: 40,
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    tooltip: 'addPost',
                    color: Colors.black,
                    splashRadius: 21,
                    onPressed: () {
                    },
                  ),
                ),
              ),
              // 検索ロゴ
              Padding(
                padding: const EdgeInsets.all(4.0),
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
              // メッセンジャーロゴ
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 4.0, bottom: 4.0, right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  height: 40,
                  width: 40,
                  child: IconButton(
                    icon: const Icon(Icons.maps_ugc),
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
                child: Column(
                  children: [
                    /// 1
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 5,
                          )
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          // 要素を左右に配置
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// ユーザー写真
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.asset('images/アザラシ.jpg').image,
                                )
                              )
                            ),
                            /// 投稿テキストフィールド
                            const Expanded(
                              child: TextField(
                                style: TextStyle(
                                color: Colors.black,
                                ),
                                enabled: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'その気持ち、シェアしよう',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.add_photo_alternate,
                                    size: 30,
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 5,
                              )
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: SizedBox(
                                  width: 100,
                                  height: 180,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.vertical(
                                                top: Radius.circular(20),
                                            ),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset('images/アザラシ.jpg').image,
                                            )
                                        ),
                                      ),
                                      const Text(
                                        textAlign: TextAlign.center,
                                        'ストーリーズ を作成',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // firestore内の要素数を取得し表示
                              // for (var i = 0; i < 10; i++)
                              Padding(
                                // TODO: ここ修正 MainAxisAlignment.spaceEvenlyに変更 start
                                padding: const EdgeInsets.all(4.0),
                                // TODO: ここ修正 MainAxisAlignment.spaceEvenlyに変更 end
                                child: Column(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset('images/river.jpg').image,
                                        )
                                      ),
                                      /// TODO: 共通化
                                      alignment: Alignment.topLeft,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: Colors.lightBlueAccent, width: 1),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(1.0),
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: Image.asset('images/ペンギン.jpg').image,
                                                      )
                                                    )
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              // padding: EdgeInsets.all(8.0),
                                              padding: EdgeInsets.only(
                                                top: 0,
                                                right: 8.0,
                                                left: 8.0,
                                                bottom: 15
                                              ),
                                              child: Text(
                                                'username',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //   padding: EdgeInsets.all(8.0),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset('images/cherry_blossoms.jpg').image,
                                        )
                                      ),
                                      /// TODO: 共通化
                                      alignment: Alignment.topLeft,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: Colors.lightBlueAccent, width: 1),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(1.0),
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: Image.asset('images/ししまい.png').image,
                                                      )
                                                    )
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              // padding: EdgeInsets.all(8.0),
                                              padding: EdgeInsets.only(
                                                top: 0,
                                                right: 8.0,
                                                left: 8.0,
                                                bottom: 15
                                              ),
                                              child: Text(
                                                'username',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //   padding: EdgeInsets.all(8.0),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset('images/shrine.jpg').image,
                                        )
                                      ),
                                      /// TODO: 共通化
                                      alignment: Alignment.topLeft,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: Colors.lightBlueAccent, width: 1),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(1.0),
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: Image.asset('images/はにわ.jpg').image,
                                                      )
                                                    )
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              // padding: EdgeInsets.all(8.0),
                                              padding: EdgeInsets.only(
                                                top: 0,
                                                right: 8.0,
                                                left: 8.0,
                                                bottom: 15
                                              ),
                                              child: Text(
                                                'username',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //   padding: EdgeInsets.all(8.0),
                                  ],
                                ),
                              ),
                            ],
                          )
                        )
                      )
                    ),
                    /// 3
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 5,
                              )
                          )
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// ユーザー写真
                                Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: Image.asset('images/馬.jpg').image,
                                        )
                                    )
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'username',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                          ),
                                        ),
                                        Text(
                                          '〇月〇日 23:59:59',
                                          style: TextStyle(
                                            fontSize: 8.0,
                                            color: Colors.grey
                                          )
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: SizedBox(
                                        width: 30,
                                        child: Icon(
                                          Icons.more_horiz,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: SizedBox(
                                        width: 30,
                                        child: Icon(
                                          Icons.close,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                /// ユーザー写真
                                // Icon(
                                //   Icons.account_circle,
                                //   size: 40,
                                //   color: Colors.indigo,
                                // ),
                                // /// ユーザー名と投稿日付
                                // Column(
                                //   children: [
                                //     Text('username'),
                                //     Text('date'),
                                //   ],
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   children: [
                                //     /// アイコン
                                //     Padding(
                                //       padding: EdgeInsets.all(5),
                                //       child: Icon(
                                //         Icons.more_horiz,
                                //         size: 30,
                                //         color: Colors.black,
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: EdgeInsets.all(5),
                                //       child: Icon(
                                //         Icons.close,
                                //         size: 30,
                                //         color: Colors.black,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: Text('投稿内容テキスト投稿内容テキスト投稿内容テキスト投稿内容テキスト'),
                            )
                          ),
                          Image.asset('images/temple.jpg'),
                          // Icon(
                          //   Icons.home,
                          //   size: 350,
                          // ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: ListTile(
                                    title: Text(
                                        'いいね！',
                                        style: TextStyle(fontSize: 10)
                                    ),
                                    leading: Icon(Icons.thumb_up),
                                    minLeadingWidth: 10.0,
                                  ),
                              ),
                              Expanded(
                                  child: ListTile(
                                    title: Text(
                                      'コメントする',
                                      style: TextStyle(fontSize: 10)
                                    ),
                                    leading: Icon(Icons.chat_bubble),
                                    minLeadingWidth: 10.0,
                                  )
                              ),
                              Expanded(
                                  child: ListTile(
                                    title: Text('シェア', style: TextStyle(fontSize: 13)),
                                    leading: Icon(Icons.share),
                                    minLeadingWidth: 10.0,
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    /// 4
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 5,
                          )
                        )
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0),
                            child: Row(
                              // 要素を左右に配置
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                      '知り合いかも',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    /// アイコン
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.more_horiz,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.close,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          /// ここ
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                // for (int i = 0; i < 4; i++)
                                Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  child: SizedBox(
                                    width: 250,
                                    height: 370,
                                    child: Column(
                                      children: [
                                        Container(
                                          width:250,
                                          height: 250,
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset('images/羊.png').image,
                                              )
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'username',
                                              style: TextStyle(
                                                fontSize: 20,
                                              )
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.indigo,
                                                  onPrimary: Colors.white,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const Login(title: '',)),
                                                  );
                                                },
                                                icon: const Icon(Icons.person_add),
                                                label: const Text('友達を追加'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.grey[200],
                                                  foregroundColor: Colors.black,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const Login(title: '',)),
                                                  );
                                                },
                                                child: const Text('削除する'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  child: SizedBox(
                                    width: 250,
                                    height: 370,
                                    child: Column(
                                      children: [
                                        Container(
                                          width:250,
                                          height: 250,
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset('images/しか.jpg').image,
                                              )
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'username',
                                              style: TextStyle(
                                                fontSize: 20,
                                              )
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.indigo,
                                                  onPrimary: Colors.white,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const Login(title: '',)),
                                                  );
                                                },
                                                icon: const Icon(Icons.person_add),
                                                label: const Text('友達を追加'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.grey[200],
                                                  foregroundColor: Colors.black,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const Login(title: '',)),
                                                  );
                                                },
                                                child: const Text('削除する'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  child: SizedBox(
                                    width: 250,
                                    height: 370,
                                    child: Column(
                                      children: [
                                        Container(
                                          width:250,
                                          height: 250,
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset('images/かぶとむし.jpg').image,
                                              )
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'username',
                                              style: TextStyle(
                                                fontSize: 20,
                                              )
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.indigo,
                                                  onPrimary: Colors.white,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const Login(title: '',)),
                                                  );
                                                },
                                                icon: const Icon(Icons.person_add),
                                                label: const Text('友達を追加'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.grey[200],
                                                  foregroundColor: Colors.black,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const Login(title: '',)),
                                                  );
                                                },
                                                child: const Text('削除する'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  child: SizedBox(
                                    width: 250,
                                    height: 370,
                                    child: Column(
                                      children: [
                                        Container(
                                          width:250,
                                          height: 250,
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset('images/きりん.jpg').image,
                                              )
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 60,
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'username',
                                              style: TextStyle(
                                                fontSize: 20,
                                              )
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.indigo,
                                                  onPrimary: Colors.white,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const Login(title: '',)),
                                                  );
                                                },
                                                icon: const Icon(Icons.person_add),
                                                label: const Text('友達を追加'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.grey[200],
                                                  foregroundColor: Colors.black,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const Login(title: '',)),
                                                  );
                                                },
                                                child: const Text('削除する'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ListTile(
                            title: const Text(
                              'すべて見る',
                              textAlign: TextAlign.center,
                            ),
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => const Login(title: '',)),
                            //   );
                            // },
                            onTap: () async {
                              final document = await FirebaseFirestore.instance
                                  .collection('tests')
                                  .doc('rvCw12kqWXOwTuMKlV1n')
                                  .get();
                              setState(() {
                                orderDocumentInfo =
                                '${document['username']}';
                              });
                            }
                          ),
                          ListTile(title: Text(orderDocumentInfo)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ])
          ),
        ],
      ),
    );
  }
}