class Question {
  String? _question;
  List<String> _options = [];
  int? _answer;
  int? _marks;
  int? _incorrectmarksDeduct;
  int? _time; // in minute

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
  String? testTitle;
  int? maxMarks;
  DateTime? testDate;
  int? testDuration;
  String? note;
  bool dynamicDuration = true;
  bool dynamicMarks = true;

  QuestionList({
    this.testTitle = '',
    this.maxMarks = 0,
    DateTime? testdate,
    this.testDuration = 0,
    this.note,
  }) {
    if (testdate == null) this.testDate = DateTime.now();
    if (this.maxMarks != 0) this.dynamicMarks = false;
    if (this.testDuration != 0) this.dynamicDuration = false;
  }

  void addNewQuestion(String ques, String opt1, String opt2, String opt3,
      String opt4, int ans, int marks, int marksDeduct, int time) {
    Question question =
        Question(ques, opt1, opt2, opt3, opt4, ans, marks, marksDeduct, time);
    this.test.add(question);
    if (this.dynamicMarks) this.maxMarks = this.maxMarks! + marks;
    if (this.dynamicDuration) this.testDuration = this.testDuration! + time;
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
    if (this.dynamicMarks)
      this.maxMarks =
          this.maxMarks! + marks - (test[questionNumber]._marks ?? 0);
    if (this.dynamicDuration)
      this.testDuration =
          this.testDuration! + time - (test[questionNumber]._time ?? 0);
    this.test[questionNumber].modifyQuestion(
        ques, opt1, opt2, opt3, opt4, ans, marks, marksDeduct, time);
  }
}

List<Question> questions = [
  Question('2+2 = ?', '2', '4', '5', '3', 2, 4, 1, 1),
  Question('What is the worst case time complexity of the merge sort?', 'O(n)',
      'O(logn)', 'O(nlogn)', 'O(n^2)', 3, 4, 1, 1),
  Question('What is the worst case time complexity of the quick sort?', 'O(n)',
      'O(logn)', 'O(nlogn)', 'O(n^2)', 4, 4, 1, 1),
  Question('What is the best case time complexity of the merge sort?', 'O(n)',
      'O(logn)', 'O(nlogn)', 'O(n^2)', 3, 4, 1, 1),
  Question('What is the best case time complexity of the quick sort?', 'O(n)',
      'O(logn)', 'O(nlogn)', 'O(n^2)', 3, 4, 1, 1),
  Question('Which of the following is not in-place sorting algorithm?',
      'Merge Sort', 'QuickSort', 'Heap Sort', 'Bubble Sort', 1, 4, 1, 1),
  Question('Which of the following is not stable sorting algorithm? ',
      'Merge Sort', 'QuickSort', 'Insertion Sort', 'Bubble Sort', 2, 4, 1, 1),
  Question('When is India\'s Independence Day?', '15 Aug', '14 Aug', '26 Jan',
      '31 Dec', 1, 4, 1, 1),
  Question('When is Sezal\'s birthday?', '2 Oct', '11 Mar', '18 jan', '11 Oct',
      4, 4, 1, 1),
  Question('9^2 = ?', '81', '11', '18', '7', 1, 4, 1, 1),
];
