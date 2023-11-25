import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testownik/models/quizzes_model.dart';
import 'package:testownik/widgets/home_app_bar.dart';
import 'package:testownik/widgets/quiz_card.dart';
import 'package:testownik/widgets/speed_dial.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (context) => ReorderableListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              buildDefaultDragHandles: false,
              onReorder: (oldIndex, newIndex) {
                if (oldIndex < newIndex) newIndex -= 1;

                context.read<QuizzesModel>().reorder(oldIndex, newIndex);
              },
              proxyDecorator:
                  (Widget child, int index, Animation<double> animation) =>
                      child,
              children: context
                  .watch<QuizzesModel>()
                  .quizzes
                  .map(
                    (quiz) => QuizCard(
                      quiz,
                      key: Key(quiz),
                      index: context.read<QuizzesModel>().quizzes.indexOf(quiz),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
      appBar: const HomeAppBar(),
      floatingActionButton: const SpeedDial(),
    );
  }
}
