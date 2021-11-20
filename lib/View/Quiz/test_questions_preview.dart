import 'package:flutter/material.dart';
import 'package:learning_management/Controller/test_questions.dart';
import 'package:learning_management/View/Quiz/add_questions.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/View/Widgets/bordered_container.dart';
import 'package:learning_management/View/Widgets/extended_appbar.dart';
import 'package:learning_management/View/Widgets/rounded_rectangle_button.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class TestQuestionsPreview extends StatelessWidget {
  TestQuestionsPreview(this.testDetails);
  final QuestionList testDetails;

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
              title: 'Question Preview',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: SmallText(
                text:
                    'Total Questions: ${this.testDetails.test.length.toString()}',
                color: AppColors.redish,
              ),
            ),
            Flexible(
              child: Scrollbar(
                isAlwaysShown: true,
                thickness: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16),
                  child: ListView.builder(
                    itemCount: testDetails.test.length,
                    itemBuilder: (BuildContext context, int index) {
                      int n = testDetails.test.isEmpty
                          ? 0
                          : testDetails.test.length;
                      print('N: $n');
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => AddQuestions(
                                this.testDetails,
                                questionNumber: index,
                              ),
                            ),
                          );
                        },
                        child: TileDesign(
                          questionList: testDetails,
                          n: n,
                          index: index,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32, bottom: 32),
              child: RoundedRectangleButton(
                size: size,
                fillColor: AppColors.midnightBlue,
                borderColor: AppColors.midnightBlue,
                child: MediumText(
                  text: 'Upload Quiz',
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TileDesign extends StatelessWidget {
  const TileDesign({
    Key? key,
    required this.questionList,
    required this.n,
    required this.index,
  }) : super(key: key);

  final QuestionList? questionList;
  final int n;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BorderedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(
              text:
                  'Q${index + 1}: ${questionList!.test[index % n].question ?? 'No Content Available'}',
            ),
            Align(
              alignment: Alignment.topRight,
              child: SmallText(
                text:
                    'Marks: ${questionList!.test[index % n].marks ?? '-'} ( -${questionList!.test[index % n].marksDeduct ?? '-'})',
                color: AppColors.redish,
              ),
            ),
            SmallText(
              text:
                  '    1. ${questionList!.test[index % n].options?[0] ?? 'No Content Available'}',
            ),
            SmallText(
              text:
                  '    2. ${questionList!.test[index % n].options?[1] ?? 'No Content Available'}',
            ),
            SmallText(
              text:
                  '    3. ${questionList!.test[index % n].options?[2] ?? 'No Content Available'}',
            ),
            SmallText(
              text:
                  '    4. ${questionList!.test[index % n].options?[3] ?? 'No Content Available'}',
            ),
            Align(
              alignment: Alignment.topRight,
              child: SmallText(
                text: 'Time: ${questionList!.test[index % n].time ?? '-'} sec',
                color: AppColors.redish,
              ),
            ),
            SmallText(
              text:
                  'Answer Key: ${questionList!.test[index % n].answer ?? '-'}',
            )
          ],
        ),
      ),
    );
  }
}
