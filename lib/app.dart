import 'package:flutter/material.dart';
import 'package:testownik/themes.dart';
import 'package:testownik/views/home_view.dart';

class TestownikApp extends StatelessWidget {
  const TestownikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testownik',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
