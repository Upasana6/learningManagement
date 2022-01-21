import 'package:flutter/material.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/View/Widgets/extended_appbar.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class TestSubmit extends StatelessWidget {
  final int marks;
  final int totalMarks;
  const TestSubmit(this.marks, this.totalMarks);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppbarWithBackAndMenu(
            size: size,
            buttonColor: AppColors.white,
            backgroundColor: AppColors.midnightBlue,
          ),
          ExtendedAppbar(
            size: size,
            title: "Result",
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MediumText(
                  text:
                      'Congratulations! Your test got submitted successfully.',
                  color: AppColors.midnightBlue,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                MediumText(
                  text: 'You secured ${this.marks} out of ${this.totalMarks}',
                  color: AppColors.redish,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
