import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class QuizCard extends StatelessWidget {
  const QuizCard(this.quiz, {super.key});

  final String quiz;

  final snackBar = const SnackBar(content: Text('Not implemented!'));

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15.0),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(snackBar),
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  quiz,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: const Text(
                'v1.2.3 • 21 pytań',
                style: TextStyle(color: Colors.white70),
              ),
              leading: const Icon(
                TablerIcons.code,
                color: Color(0xFF3378FF),
              ),
              trailing: const Icon(
                TablerIcons.chevron_right,
                color: Color(0xFFA5A5A5),
              ),
            ),
            LinearProgressIndicator(
              value: 0.45,
              color: const Color(0xFF39B54A),
              backgroundColor: const Color(0xFF39B54A).withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
