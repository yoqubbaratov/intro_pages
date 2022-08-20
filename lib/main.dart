import 'package:flutter/material.dart';
import 'package:intro_pages/pages/home_page.dart';
import 'package:intro_pages/pages/start_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool("showHome") ?? false;

  runApp(MyApp(
    showHome: showHome,
  ));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: showHome ? const HomePage() : const StartPage(),
      routes: {
        StartPage.id: (context) => const StartPage(),
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}
