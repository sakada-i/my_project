import 'package:flutter/material.dart';

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

    // デバイスの画面高さを取得
    final double deviceHeight = MediaQuery.of(context).size.height;
    // デバイスの画面幅を取得
    final double deviceWidth = MediaQuery.of(context).size.width;

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
                      // モーダルダイアログの表示
                      showModalBottomSheet(
                        //モーダルの背景の色、透過
                          backgroundColor: Colors.transparent,
                          //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              margin: const EdgeInsets.only(top: 100),
                              // height: 150,
                              decoration: const BoxDecoration(
                                //モーダル自体の色
                                color: Colors.white,
                                //角丸にする
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: const Center(
                                child: Text('モーダルダイアログの表示'),
                              ),
                            );
                          }
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
                    /// 1
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0, bottom: 6.0, right: 10.0),
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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0),
                              child: TextButton(
                                onPressed: () {
                                },
                                child: const Text(
                                  'その気持ち、シェアしよう',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            // child: TextField(
                            //   style: TextStyle(
                            //     color: Colors.black,
                            //   ),
                            //   enabled: true,
                            //   decoration: InputDecoration(
                            //     border: InputBorder.none,
                            //     hintText: 'その気持ち、シェアしよう',
                            //     hintStyle: TextStyle(
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            // ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // TODO:新規投稿アイコンタップ時の挙動
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

                    /// 区切り線
                    const Divider(
                      color: Colors.grey,
                      thickness: 5,
                      // indent: 20,
                      // endIndent: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
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
                    ),

                    /// 区切り線
                    const Divider(
                      color: Colors.grey,
                      thickness: 5,
                      // indent: 20,
                      // endIndent: 20,
                    ),
                    
                    /// 3
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.more_horiz),
                                    iconSize: 30,
                                    splashRadius: 27,
                                    onPressed: () {
                                      // モーダルダイアログの表示
                                      showModalBottomSheet(
                                        //モーダルの背景の色、透過
                                        backgroundColor: Colors.transparent,
                                        //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            // 画面サイズから表示領域を指定
                                            // margin: const EdgeInsets.only(top: 700),
                                            // 画面サイズに関係なく表示領域を指定
                                            height: deviceHeight * 0.4,
                                            decoration: const BoxDecoration(
                                              //モーダル自体の色
                                              color: Colors.white,
                                              //角丸にする
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text('モーダルダイアログの表示'),
                                            ),
                                          );
                                        }
                                      );
                                    },
                                  ),
                                  // TODO:✕アイコンタップ時の挙動
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    iconSize: 30,
                                    splashRadius: 22,
                                    onPressed: () {
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 0.0, left: 10.0, bottom: 3.0, right: 10.0),
                          child: Text('投稿内容テキスト投稿内容テキスト投稿内容テキスト投稿内容テキスト')
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

                    /// 区切り線
                    const Divider(
                      color: Colors.grey,
                      thickness: 5,
                      // indent: 20,
                      // endIndent: 20,
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
                          Padding(
                            // padding: EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0),
                            padding: const EdgeInsets.only(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0),
                            child: Row(
                              // 要素を左右に配置
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                      '知り合いかも',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.more_horiz),
                                      iconSize: 30,
                                      splashRadius: 22,
                                      onPressed: () {
                                        // モーダルダイアログの表示
                                        showModalBottomSheet(
                                          //モーダルの背景の色、透過
                                            backgroundColor: Colors.transparent,
                                            //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                // 画面サイズから表示領域を指定
                                                // margin: const EdgeInsets.only(top: 700),
                                                // 画面サイズに関係なく表示領域を指定
                                                height: deviceHeight * 0.4,
                                                decoration: const BoxDecoration(
                                                  //モーダル自体の色
                                                  color: Colors.white,
                                                  //角丸にする
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20),
                                                    topRight: Radius.circular(20),
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('モーダルダイアログの表示'),
                                                ),
                                              );
                                            }
                                        );
                                      },
                                    ),
                                    // TODO:✕アイコンタップ時の挙動
                                    IconButton(
                                      icon: const Icon(Icons.close),
                                      iconSize: 30,
                                      splashRadius: 22,
                                      onPressed: () {
                                      },
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
                                for (int i = 0; i < 4; i++)
                                // 各ユーザー
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
                            onTap: () async {
                              // 画面遷移
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => const Login(title: '',)),
                              // );
                              // firestoreから値を取得
                              // final document = await FirebaseFirestore.instance
                              //     .collection('tests')
                              //     .doc('rvCw12kqWXOwTuMKlV1n')
                              //     .get();
                              // setState(() {
                              //   orderDocumentInfo =
                              //   '${document['username']}';
                              // });
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
                            }
                          ),
                          // ListTile(title: Text(orderDocumentInfo)),
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