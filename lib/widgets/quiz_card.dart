import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:testownik/providers/home_provider.dart';

class QuizCard extends StatelessWidget {
  const QuizCard(this.quiz, {required super.key, required this.index});

  final String quiz;

  final int index;

  final _snackBar = const SnackBar(content: Text('Not implemented!'));

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15.0),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onLongPress: () => context.read<HomeProvider>().switchReorderable(true),
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(_snackBar),
        child: ReorderableDragStartListener(
          index: index,
          enabled: context.watch<HomeProvider>().isReorderable,
          child: Column(
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    quiz,
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
                trailing: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) =>
                          ScaleTransition(scale: animation, child: child),
                  child: context.read<HomeProvider>().isReorderable
                      ? const Icon(
                          key: ValueKey(1),
                          TablerIcons.menu,
                          color: Color(0xFFA5A5A5),
                        )
                      : const Icon(
                          key: ValueKey(2),
                          TablerIcons.chevron_right,
                          color: Color(0xFFA5A5A5),
                        ),
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
      ),
    );
  }
}
