import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 126, 218, 241)),
      ),
      debugShowCheckedModeBanner: false,
      home : LoginPage(),
    );
  }
}
