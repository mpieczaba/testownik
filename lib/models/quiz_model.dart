import 'dart:io';

class QuizModel {
  String name;
  String path;
  String version = "legacy";
  int questionsNumber = 0;
  double completion = 0;

  QuizModel({required this.name, required this.path}) {
    final quizDirectory = Directory(path);
    questionsNumber = quizDirectory.listSync().toList().length;
  }

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    String path = json['path'];
    String version = json['version'];
    int questionsNumber = json['questionsNumber'];
    double completion = json['completion'];

    final quizModel = QuizModel(name: name, path: path);
    quizModel.version = version;
    quizModel.questionsNumber = questionsNumber;
    quizModel.completion = completion;

    return quizModel;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['path'] = path;
    data['version'] = version;
    data['questionsNumber'] = questionsNumber;
    data['completion'] = completion;

    return data;
  }
}
