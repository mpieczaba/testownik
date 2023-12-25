import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testownik/models/quiz_model.dart';
import 'package:testownik/models/quizzes_list_item_model.dart';
import 'package:testownik/repositories/quiz_repository.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider({required this.prefs});

  final SharedPreferences prefs;

  late final QuizRepository _quizzesRepository = QuizRepository(prefs: prefs);

  late List<QuizzesListItemModel> quizzes = _quizzesRepository.quizzes
      .map((quiz) => QuizzesListItemModel()..setData(quiz))
      .toList();

  bool _isReorderable = false;

  bool get isReorderable => _isReorderable;

  void addQuiz(String name, String path) {
    if (quizzes.where((quiz) => quiz.name == name).isNotEmpty) return;

    _quizzesRepository.addQuiz(QuizModel(name: name, path: path));
    _updateQuizzesList();

    notifyListeners();
  }

  void removeQuizzes() {
    quizzes
        .where((quiz) => quiz.isChecked)
        .forEach((quiz) => _quizzesRepository.removeQuiz(quiz.name));
    _updateQuizzesList();

    notifyListeners();
  }

  void checkQuiz(String name) {
    quizzes = quizzes.map((quiz) {
      if (quiz.name == name) quiz.isChecked = !quiz.isChecked;

      return quiz;
    }).toList();

    notifyListeners();
  }

  void switchReorderable(bool value) {
    _isReorderable = value;

    if (!value) {
      quizzes
          .where((quiz) => quiz.isChecked)
          .forEach((quiz) => quiz.isChecked = false);
    }

    notifyListeners();
  }

  void reorder(int oldIndex, int newIndex) {
    _quizzesRepository.reorderQuizzes(oldIndex, newIndex);
    _updateQuizzesList();

    notifyListeners();
  }

  void _updateQuizzesList() {
    quizzes = _quizzesRepository.quizzes
        .map((quiz) => QuizzesListItemModel()..setData(quiz))
        .toList();
  }
}
