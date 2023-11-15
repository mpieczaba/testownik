import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:testownik/themes.dart';
import 'package:testownik/widgets/quiz_card.dart';
import 'package:testownik/widgets/speed_dial.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final snackBar = const SnackBar(content: Text('Not implemented!'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          return const QuizCard();
        },
      ),
      appBar: AppBar(
        title: const Text(
          'Testownik',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        // TODO: Change to more dektop-friendly Tooltip widget
        actions: [
          IconButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).showSnackBar(snackBar),
            icon: const Icon(TablerIcons.search),
            tooltip: 'Szukaj',
          ),
          IconButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).showSnackBar(snackBar),
            icon: const Icon(TablerIcons.settings),
            tooltip: 'Ustawienia',
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: theme.appBarTheme.backgroundColor,
        ),
      ),
      floatingActionButton: const SpeedDial(),
    );
  }
}
