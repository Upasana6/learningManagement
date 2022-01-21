import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_management/Controller/test_questions.dart';
import 'package:learning_management/View/Quiz/test_submit.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/View/Widgets/extended_appbar.dart';
import 'package:learning_management/View/Widgets/rounded_rectangle_button.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class TakeQuiz extends StatefulWidget {
  final QuestionList testDetail;
  // final int questionNumber;
  // const TakeQuiz(this.testDetail, {this.questionNumber = 0});
  const TakeQuiz(this.testDetail);

  @override
  State<TakeQuiz> createState() => _TakeQuizState();
}

class _TakeQuizState extends State<TakeQuiz> {
  DateTime? dateTime;
  //  li = [];
  // int totalMinutesRemaining = 1;
  // int totalSecondsRemaining = 5;
  List<int> totalTimeRemaining = [1, 5];
  // int questionMinutesRemaining = 0;
  // int questionSecondsRemaining = 10;
  List<int> questionTimeRemaining = [0, 10];
  int questionNumber = 0;
  String selectedResult = '0';

  Question? currentQuestion;

  int obtainedMarks = 0;

  void initializeTest() {
    dateTime = DateTime.now();

    totalTimeRemaining[0] = this.widget.testDetail.testDuration ?? 0 - 1;
    totalTimeRemaining[0]--;
    totalTimeRemaining[1] = totalTimeRemaining[0] < 0 ? 0 : 60;

    initializeForQuestion();
  }

  void initializeForQuestion() {
    if (this.questionNumber >= widget.testDetail.test.length) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => TestSubmit(
            this.obtainedMarks,
            widget.testDetail.maxMarks ?? 0,
          ),
        ),
      );
    }

    if (this.questionNumber < widget.testDetail.test.length) {
      print('Time: ${this.widget.testDetail.test[this.questionNumber].time}');
      questionTimeRemaining[0] =
          this.widget.testDetail.test[this.questionNumber].time ?? 0;
      questionTimeRemaining[0]--;
      questionTimeRemaining[1] = questionTimeRemaining[0] < 0 ? 0 : 60;

      currentQuestion = widget.testDetail.test[this.questionNumber];

      print(
          'Time: ${this.widget.testDetail.test[this.questionNumber].time} ${this.questionTimeRemaining[0]}');

      this.selectedResult = '0';
    }
  }

  @override
  void initState() {
    initializeTest();
    super.initState();
    startTimer();
  }

  void calcMarks() {
    if (int.parse(this.selectedResult) == currentQuestion?.answer) {
      this.obtainedMarks += currentQuestion?.marks ?? 0;
    } else if (this.selectedResult != '0') {
      this.obtainedMarks -= currentQuestion?.marksDeduct ?? 0;
    }

    print('Marks: ${this.obtainedMarks}');
  }

  void startTimer() async {
    Timer.periodic(Duration(seconds: 1), (time) {
      if (this.totalTimeRemaining[1] > 0 || this.totalTimeRemaining[0] > 0) {
        setState(() {
          if (this.totalTimeRemaining[1] > 0) {
            this.totalTimeRemaining[1] -= 1;
          } else {
            this.totalTimeRemaining[0] -= 1;
            this.totalTimeRemaining[1] = 59;
          }
        });
      } else {
        calcMarks();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => TestSubmit(
              this.obtainedMarks,
              widget.testDetail.maxMarks ?? 0,
            ),
          ),
        );
      }
      // increamenter(this.totalMinutesRemaining, this.questionSecondsRemaining);
      if (this.questionTimeRemaining[1] > 0 ||
          this.questionTimeRemaining[0] > 0) {
        setState(() {
          if (this.questionTimeRemaining[1] > 0) {
            this.questionTimeRemaining[1] -= 1;
          } else {
            this.questionTimeRemaining[0] -= 1;
            this.questionTimeRemaining[1] = 59;
          }
        });
      } else {
        // Naviagate to new screen
        calcMarks();
        this.questionNumber++;

        initializeForQuestion();
        setState(() {});
      }
    });
  }

  Widget questionsUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            MediumText(
              text:
                  'Q${this.questionNumber + 1}: ${this.currentQuestion?.question}',
              color: AppColors.midnightBlue,
            ),
            ListTile(
              title: SmallText(text: '${this.currentQuestion?.options![0]}'),
              leading: Radio<String>(
                value: 1.toString(),
                groupValue: selectedResult.toString(),
                onChanged: (value) {
                  print(value);
                  this.selectedResult = value ?? '0';
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: SmallText(text: '${this.currentQuestion?.options![1]}'),
              leading: Radio<String>(
                value: 2.toString(),
                groupValue: selectedResult.toString(),
                onChanged: (value) {
                  print(value);
                  this.selectedResult = value ?? '0';
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: SmallText(text: '${this.currentQuestion?.options![2]}'),
              leading: Radio<String>(
                value: 3.toString(),
                groupValue: selectedResult.toString(),
                onChanged: (value) {
                  print(value);
                  this.selectedResult = value ?? '0';
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: SmallText(text: '${this.currentQuestion?.options![3]}'),
              leading: Radio<String>(
                value: 4.toString(),
                groupValue: selectedResult.toString(),
                onChanged: (value) {
                  print(value);
                  this.selectedResult = value ?? '0';
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarWithBackAndMenu(
              size: size,
              backgroundColor: AppColors.midnightBlue,
              buttonColor: AppColors.white,
            ),
            ExtendedAppbar(
              size: size,
              title: "", //widget.testDetail.testTitle.toString(),
              subtitle: SmallText(
                text:
                    'Remaining Question: ${widget.testDetail.test.length - this.questionNumber - 1}',
                color: AppColors.white,
              ),
            ),
            // Container(
            //   child: MediumText(
            //     text: time.toString(),
            //   ),
            // ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                          // horizontal: 32.0,
                          // vertical: 16,
                          32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            text: 'Quiz',
                          ),
                          Row(
                            children: [
                              SmallText(
                                text: 'Time: ',
                              ),
                              SmallText(
                                text:
                                    '${this.totalTimeRemaining[0]}:${this.totalTimeRemaining[1].toString().length == 1 ? '0' + totalTimeRemaining[1].toString() : this.totalTimeRemaining[1].toString()}',
                                color: AppColors.midnightBlue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    questionsUI(),
                    MediumText(
                      text:
                          '${this.questionTimeRemaining[0]}:${this.questionTimeRemaining[1].toString().length == 1 ? '0' + this.questionTimeRemaining[1].toString() : this.questionTimeRemaining[1].toString()}',
                      color: AppColors.redish,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: size.width / 3,
                            child: RoundedRectangleButton(
                              onTap: () {
                                // Calculate marks for current question
                                calcMarks();
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => TestSubmit(
                                      this.obtainedMarks,
                                      widget.testDetail.maxMarks ?? 0,
                                    ),
                                  ),
                                );
                              },
                              size: size,
                              child: Center(
                                child: SmallText(
                                  text: 'Submit Test',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width / 3,
                            child: RoundedRectangleButton(
                              onTap: () {
                                calcMarks();
                                this.questionNumber++;

                                initializeForQuestion();
                              },
                              size: size,
                              fillColor: AppColors.midnightBlue,
                              borderColor: AppColors.midnightBlue,
                              child: Center(
                                child: SmallText(
                                  text: 'Save & Next',
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
