import 'package:flutter/material.dart';
import 'package:learning_management/Controller/test_questions.dart';
import 'package:learning_management/View/Quiz/add_questions.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/View/Widgets/custom_text_field.dart';
import 'package:learning_management/View/Widgets/extended_appbar.dart';
import 'package:learning_management/View/Widgets/rounded_rectangle_button.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class QuizUpload extends StatefulWidget {
  @override
  _QuizUploadState createState() => _QuizUploadState();
}

class _QuizUploadState extends State<QuizUpload> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController marksController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final DateTime dateTime = DateTime.now();
  DateTime? testDate;

  final _formKey = GlobalKey<FormState>();

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
              title: 'Subject Title',
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // TODO information box for the textField where required
                        // as that for maxMarks as it can also be dynamically be filled
                        // and testDuration can also be as the sum of all the individual questions
                        // if left unfilled
                        CustomTextField(
                          textEditingController: this.titleController,
                          labelText: 'Test Title',
                        ),
                        CustomTextField(
                          textEditingController: this.marksController,
                          labelText: 'Max Marks',
                        ),
                        dateSelection(size, context, 'Test Date'),
                        CustomTextField(
                          textEditingController: this.durationController,
                          labelText: 'Test Duration (in min)',
                          keyboardType: TextInputType.number,
                        ),
                        CustomTextField(
                          textEditingController: noteController,
                          labelText: 'Add notes ... ',
                          minLines: 5,
                        ),
                        RoundedRectangleButton(
                          onTap: () {
                            print('Data: ${this.marksController.text}');
                            QuestionList test = QuestionList(
                              testTitle: this.titleController.text,
                              maxMarks: int.parse(
                                  this.marksController.text == ""
                                      ? '0'
                                      : this.marksController.text),
                              testdate: this.testDate ?? DateTime.now(),
                              testDuration: int.parse(
                                  this.durationController.text == ""
                                      ? '0'
                                      : this.durationController.text),
                              note: this.noteController.text,
                            );
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => AddQuestions(test),
                              ),
                            );
                          },
                          size: size,
                          fillColor: AppColors.midnightBlue,
                          borderColor: AppColors.midnightBlue,
                          child: Center(
                            child: MediumText(
                              text: 'Add Questions',
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate(context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: this.dateTime,
      firstDate: this.dateTime,
      lastDate: DateTime(this.dateTime.year + 1),
    );
    if (pickedDate != null && pickedDate != this.testDate)
      setState(() {
        this.testDate = pickedDate;
        print(pickedDate);
      });
  }

  Stack dateSelection(Size size, BuildContext context, String text) {
    return Stack(
      children: [
        RoundedRectangleButton(
          size: size,
          // assignmentDate: assignmentStartEndDate[date],
          onTap: () {
            _selectDate(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText(
                text: this.testDate == null
                    ? text
                    : this.testDate!.day.toString() +
                        '-' +
                        this.testDate!.month.toString() +
                        '-' +
                        this.testDate!.year.toString(),
              ),
              this.testDate == null
                  ? Icon(
                      Icons.calendar_today,
                      color: AppColors.midnightBlue,
                    )
                  : Container(),
            ],
          ),
          // text: text,
        ),
        this.testDate != null
            ? Positioned(
                top: -2,
                left: 16,
                child: Container(
                  color: AppColors.white,
                  // padding: EdgeInsets.symmetric(horizontal: ),
                  child: Row(
                    children: [
                      Text('$text'),
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
