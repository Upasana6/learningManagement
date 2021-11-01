import 'package:flutter/material.dart';
import 'package:learning_management/Controller/test_questions.dart';
import 'package:learning_management/View/Quiz/test_questions_preview.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/View/Widgets/custom_text_field.dart';
import 'package:learning_management/View/Widgets/extended_appbar.dart';
import 'package:learning_management/View/Widgets/rounded_rectangle_button.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class AddQuestions extends StatefulWidget {
  @override
  _AddQuestionsState createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {
  QuestionList questionList = QuestionList();

  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();
  TextEditingController answerController = TextEditingController();
  TextEditingController marksController = TextEditingController();
  TextEditingController incorrectMarksController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarWithBackAndMenu(
              size: size,
              buttonColor: AppColors.white,
              backgroundColor: AppColors.midnightBlue,
            ),
            ExtendedAppbar(
              size: size,
              title:
                  'Question Number ${this.questionList.test.isEmpty ? 1 : this.questionList.test.length + 1}',
            ),
            Flexible(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      CustomTextField(
                        textEditingController: this.timeController,
                        labelText: 'Time (in seconds)',
                        keyboardType: TextInputType.number,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width / 2.6,
                            child: CustomTextField(
                              textEditingController: this.marksController,
                              labelText: 'Marks Offered',
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            width: size.width / 2.6,
                            child: CustomTextField(
                              textEditingController:
                                  this.incorrectMarksController,
                              labelText: 'Deduct Marks',
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CustomTextField(
                        textEditingController: this.questionController,
                        labelText: 'Question',
                        minLines: 5,
                      ),
                      CustomTextField(
                        textEditingController: this.option1Controller,
                        labelText: 'Option1',
                      ),
                      CustomTextField(
                        textEditingController: this.option2Controller,
                        labelText: 'Option2',
                      ),
                      CustomTextField(
                        textEditingController: this.option3Controller,
                        labelText: 'Option3',
                      ),
                      CustomTextField(
                        textEditingController: this.option4Controller,
                        labelText: 'Option4',
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CustomTextField(
                        textEditingController: answerController,
                        labelText: 'Correct Option (in number)',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width / 2.7,
                            child: RoundedRectangleButton(
                              onTap: addQuestion,
                              size: size,
                              fillColor: AppColors.midnightBlue,
                              borderColor: AppColors.midnightBlue,
                              child: Center(
                                child: MediumText(
                                  text: 'Add Next',
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width / 2.7,
                            child: RoundedRectangleButton(
                              onTap: () {
                                addQuestion();
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => TestQuestionsPreview(
                                        questionList: this.questionList),
                                  ),
                                );
                              },
                              size: size,
                              fillColor: AppColors.midnightBlue,
                              borderColor: AppColors.midnightBlue,
                              child: Center(
                                child: MediumText(
                                  text: 'Done',
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addQuestion() {
    this.questionList.addNewQuestion(
          this.questionController.text,
          this.option1Controller.text,
          this.option2Controller.text,
          this.option3Controller.text,
          this.option4Controller.text,
          int.parse(this.answerController.text),
          int.parse(this.marksController.text),
          int.parse(this.incorrectMarksController.text),
          int.parse(this.timeController.text),
        );
  }
}
