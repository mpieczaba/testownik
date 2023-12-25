// TODO: Implement light theme

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var theme = ThemeData(
  useMaterial3: true,
  primaryColorDark: const Color(0xFF1A1E22),
  scaffoldBackgroundColor: const Color(0xFF1A1E22),
  textTheme: GoogleFonts.openSansTextTheme(ThemeData.dark().textTheme),
  appBarTheme: const AppBarTheme(
    elevation: 1.0,
    scrolledUnderElevation: 1.0,
    backgroundColor: Color(0xFF21252B),
    foregroundColor: Colors.white,
    iconTheme: IconThemeData(color: Color(0xFFA5A5A5)),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: Color(0xFF39B54A),
  ),
  cardTheme: const CardTheme(
    elevation: 1.0,
    color: Color(0xFF25282F),
  ),
  dialogTheme: const DialogTheme(
    elevation: 1.0,
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    backgroundColor: Color(0xFF21252B),
  ),
  listTileTheme: const ListTileThemeData(textColor: Colors.white),
);
