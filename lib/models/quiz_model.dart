class QuizModel {
  String name;
  String path;
  double completion = 0;

  QuizModel({required this.name, required this.path});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    String path = json['path'];
    double completion = json['completion'];

    final quizModel = QuizModel(name: name, path: path);
    quizModel.completion = completion;

    return quizModel;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['path'] = path;
    data['completion'] = completion;

    return data;
  }
}
