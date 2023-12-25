import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:testownik/models/quiz_model.dart';

class QuizRepository {
  List<QuizModel>? _quizzes;

  List<QuizModel> get quizzes => _quizzes ?? [];

  final SharedPreferences prefs;

  QuizRepository({required this.prefs}) {
    _quizzes = prefs
        .getStringList('quizzes')
        ?.map((json) => QuizModel.fromJson(jsonDecode(json)))
        .toList();
  }

  void addQuiz(QuizModel newQuiz) {
    quizzes.add(newQuiz);
    _saveQuizzes();
  }

  void removeQuiz(String name) {
    quizzes.removeWhere((quiz) => quiz.name == name);
    _saveQuizzes();
  }

  void reorderQuizzes(int oldIndex, int newIndex) {
    final QuizModel item = quizzes.removeAt(oldIndex);
    quizzes.insert(newIndex, item);
    _saveQuizzes();
  }

  void _saveQuizzes() async => await prefs.setStringList(
      'quizzes', quizzes.map((quiz) => jsonEncode(quiz)).toList());
}
