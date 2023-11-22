import 'package:flutter/material.dart';

class QuizzesModel with ChangeNotifier {
  final List<String> _quizzes = [];

  List<String> get quizzes => _quizzes;

  void addQuiz(String quiz) {
    _quizzes.add(quiz);
    notifyListeners();
  }
}
