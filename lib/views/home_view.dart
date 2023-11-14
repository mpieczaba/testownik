import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final snackBar = const SnackBar(content: Text('Not implemented!'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Change to quizes cards
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              '$index',
              style: const TextStyle(color: Color(0xFFFFFFFF)),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: const Text(
          'Testownik',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(snackBar),
        tooltip: 'Dodaj test',
        child: const Icon(TablerIcons.plus),
      ),
    );
  }
}
