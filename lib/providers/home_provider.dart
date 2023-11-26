import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider({required this.prefs});

  final SharedPreferences prefs;

  List<String> get _quizzes => prefs.getStringList('quizzes') ?? [];

  set _quizzes(List<String> newQuizzes) =>
      (() async => await prefs.setStringList('quizzes', newQuizzes))();

  List<String> get quizzes => _quizzes;

  bool _isReorderable = false;

  bool get isReorderable => _isReorderable;

  void addQuiz(String quiz) async {
    List<String> temp = _quizzes;
    if (temp.contains(quiz)) return;
    temp.add(quiz);

    _quizzes = temp;

    notifyListeners();
  }

  void switchReorderable(bool value) {
    _isReorderable = value;
    notifyListeners();
  }

  void reorder(int oldIndex, int newIndex) async {
    List<String> temp = _quizzes;
    final String item = temp.removeAt(oldIndex);
    temp.insert(newIndex, item);

    _quizzes = temp;

    notifyListeners();
  }
}
