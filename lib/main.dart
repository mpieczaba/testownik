import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testownik/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.manageExternalStorage.request().isGranted;

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(TestownikApp(prefs: prefs));
}
