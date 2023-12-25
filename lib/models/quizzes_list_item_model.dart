import 'package:testownik/models/quiz_model.dart';

class QuizzesListItemModel {
  late String name;
  late String path;
  late double completion;

  bool isChecked = false;

  setData(QuizModel quiz) {
    name = quiz.name;
    path = quiz.path;
    completion = quiz.completion;
  }
}
