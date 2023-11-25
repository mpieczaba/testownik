import 'package:flutter/material.dart';

class QuizzesModel with ChangeNotifier {
  final List<String> _quizzes = [];

  List<String> get quizzes => _quizzes;

  bool _isReorderable = false;

  bool get isReorderable => _isReorderable;

  void addQuiz(String quiz) {
    _quizzes.add(quiz);
    notifyListeners();
  }

  void switchReorderable(bool value) {
    _isReorderable = value;
    notifyListeners();
  }

  void reorder(int oldIndex, int newIndex) {
    final String item = _quizzes.removeAt(oldIndex);
    _quizzes.insert(newIndex, item);
    notifyListeners();
  }
}
