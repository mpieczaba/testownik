import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:testownik/models/quizzes_list_item_model.dart';
import 'package:testownik/providers/home_provider.dart';

class QuizCard extends StatelessWidget {
  const QuizCard(this.quiz, {required super.key, required this.index});

  final QuizzesListItemModel quiz;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15.0),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onLongPress: () {
          context.read<HomeProvider>().switchReorderable(true);
          context.read<HomeProvider>().checkQuiz(quiz.name);
        },
        onTap: () {
          if (context.read<HomeProvider>().isReorderable) {
            context.read<HomeProvider>().checkQuiz(quiz.name);
          }
        },
        child: ReorderableDragStartListener(
          index: index,
          enabled: context.watch<HomeProvider>().isReorderable,
          child: Column(
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    quiz.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: const Text(
                  'v1.2.3 • 21 pytań',
                  style: TextStyle(color: Colors.white70),
                ),
                leading: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) =>
                          ScaleTransition(scale: animation, child: child),
                  child: context
                          .watch<HomeProvider>()
                          .quizzes
                          .firstWhere((q) => q.name == quiz.name)
                          .isChecked
                      ? const Icon(
                          key: ValueKey(1),
                          TablerIcons.circle_check,
                          color: Color(0xFF39B54A),
                        )
                      : const Icon(
                          key: ValueKey(2),
                          TablerIcons.code,
                          color: Color(0xFF3378FF),
                        ),
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
                value: quiz.completion,
                color: const Color(0xFF39B54A),
                backgroundColor: const Color(0xFF39B54A).withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
