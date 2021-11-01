class Question {
  String? _question;
  List<String> _options = [];
  int? _answer;
  int? _marks;
  int? _incorrectmarksDeduct;
  int? _time; // in second

  Question(String ques, String opt1, String opt2, String opt3, String opt4,
      int ans, int marks, int marksDeduct, int time) {
    this._question = ques;
    this._options = [opt1, opt2, opt3, opt4];
    this._answer = ans;
    this._marks = marks;
    this._time = time;
    this._incorrectmarksDeduct = marksDeduct;
  }

  void modifyQuestion(String ques, String opt1, String opt2, String opt3,
      String opt4, int ans, int marks, int marksDeduct, int time) {
    this._question = ques;
    this._options = [opt1, opt2, opt3, opt4];
    this._answer = ans;
    this._marks = marks;
    this._time = time;
    this._incorrectmarksDeduct = marksDeduct;
  }

  Map<String, dynamic> getWholeQuestion() {
    Map<String, dynamic> res = {
      'Question': this._question,
      'Options': this._options,
      'Answer': this._answer,
      'Marks': this._marks,
      'Time': this._time
    };
    return res;
  }

  String? get question {
    return this._question;
  }

  List<String>? get options {
    return this._options;
  }

  int? get answer {
    return this._answer;
  }

  int? get marks {
    return this._marks;
  }

  int? get time {
    return this._time;
  }

  int? get marksDeduct {
    return this._incorrectmarksDeduct;
  }
}

class QuestionList {
  List<Question> test = [];

  void addNewQuestion(String ques, String opt1, String opt2, String opt3,
      String opt4, int ans, int marks, int marksDeduct, int time) {
    Question question =
        Question(ques, opt1, opt2, opt3, opt4, ans, marks, marksDeduct, time);
    this.test.add(question);
  }

  void modifyQuestion(
      String ques,
      String opt1,
      String opt2,
      String opt3,
      String opt4,
      int ans,
      int marks,
      int marksDeduct,
      int time,
      int questionNumber) {
    this.test[questionNumber].modifyQuestion(
        ques, opt1, opt2, opt3, opt4, ans, marks, marksDeduct, time);
  }
}
