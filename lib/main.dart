import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/src/facebook/screens/Help.dart';
import 'package:my_project/src/facebook/screens/Login.dart';

// state管理
final countProvider = StateProvider((ref) => 0 );
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

void main() async {
  runApp(const ProviderScope(child: MyApp()));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

// class MyApp extends StatelessWidget {
class MyApp extends ConsumerWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider.notifier);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode.state,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final themeMode = ref.watch(themeModeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('First Page'),
        /// ダークモード切り替え
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: PopupMenuButton<ThemeMode>(
              icon: const Icon(Icons.settings_brightness,),
              // themeMode.state に選択された 外観モード をセットする
              onSelected: (ThemeMode selectedThemeMode) => themeMode.state = selectedThemeMode,
              itemBuilder: (context) => <PopupMenuEntry<ThemeMode>>[
                const PopupMenuItem(
                  value: ThemeMode.system,
                  child: Text('システム設定に従う'),
                ),
                const PopupMenuItem(
                  value: ThemeMode.light,
                  child: Text('ライトモード'),
                ),
                const PopupMenuItem(
                  value: ThemeMode.dark,
                  child: Text('ダークモード'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Card(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Facebook',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                leading: Image.asset(
                  'images/sns_facebook.png',
                  width: 30,
                  height: 30,
                ),
                tileColor: Colors.indigo,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login(title: '',)),
                  );
                },
              ),
              ListTile(
                title: const Text(
                    'Helpページへ遷移',
                    style: TextStyle(
                      color: Colors.white
                    ),
                ),
                leading: const Icon(Icons.settings),
                tileColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Help()),
                  );
                },
              ),
            ],
          ),
        ),
    );
  }
}