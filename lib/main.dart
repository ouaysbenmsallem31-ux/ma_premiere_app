import 'package:flutter/material.dart';

import 'login_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final connecte = prefs.getBool('connecte') ?? false;
    return MaterialApp(
      home: connecte ? const HomePage() : const LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.lightGreen,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.lightGreen),
      ),
    );
  }
}
