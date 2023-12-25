import 'package:testownik/models/quiz_model.dart';

class QuizzesListItemModel {
  late String name;
  late String path;
  late String version;
  late int questionsNumber;
  late double completion;

  bool isChecked = false;

  void setData(QuizModel quiz) {
    name = quiz.name;
    path = quiz.path;
    version = quiz.version;
    questionsNumber = quiz.questionsNumber;
    completion = quiz.completion;
  }
}
