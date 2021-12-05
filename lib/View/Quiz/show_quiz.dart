import 'package:flutter/material.dart';
import 'package:learning_management/Controller/test_questions.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/View/Widgets/extended_appbar.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class ShowQuiz extends StatelessWidget {
  const ShowQuiz(this.testDetail);
  final QuestionList testDetail;

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
              title: this.testDetail.testTitle ?? '',
              subtitle: SmallText(
                text: 'Full Marks : ${this.testDetail.maxMarks}',
                color: AppColors.white,
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: MediumText(
                          text: this.testDetail.note == ""
                              ? 'No comment available...'
                              : this.testDetail.note ?? '',
                        ),
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
}
