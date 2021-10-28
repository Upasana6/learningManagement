import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learning_management/View/NotesAndAssignments/details_of_assignment_to_upload.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/View/Widgets/extended_appbar.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class AssignmentShowingPage extends StatelessWidget {
  AssignmentShowingPage({
    @required this.title,
    this.filesUploaded,
    this.descrition,
    this.marks,
    this.submissionDate,
  });
  final List<File>? filesUploaded;
  final String? title;
  final String? descrition;
  final String? marks;
  final DateTime? submissionDate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarWithBackAndMenu(
              size: size,
              backgroundColor: AppColors.midnightBlue,
              buttonColor: AppColors.white,
            ),
            ExtendedAppbar(
              size: size,
              title: this.title ?? '',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SmallText(
                        text:
                            '${this.descrition} and ahd jahdj aiuia  qiwuidjak qiuw qwo qoio aa owkf aodj apod pp ahjsn escrition}',
                        color: AppColors.midnightBlue,
                        textAlign: TextAlign.justify,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SmallText(
                          text: 'Marks: ${this.marks ?? '__'}',
                          textAlign: TextAlign.end,
                          color: AppColors.redish,
                        ),
                      ),
                      Container(
                        height: size.height / 2.3,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: this.filesUploaded?.length,
                          itemBuilder: (context, int index) {
                            return Container(
                              height: size.width / 2 - 50,
                              width: size.width / 2 - 50,
                              color: AppColors.babyBlue,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: size.width,
                                  color: AppColors.greyish?.withOpacity(0.7),
                                  child: SmallText(
                                    text: this
                                        .filesUploaded![index]
                                        .path
                                        .split('/')
                                        .last,
                                    textAlign: TextAlign.center,
                                    color: AppColors.wheatish,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                bottom: 32,
                right: 32,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RoundedRectangleButton(
                  size: size,
                  fillColor: AppColors.midnightBlue,
                  borderColor: AppColors.midnightBlue,
                  child: Center(
                    child: MediumText(
                      text: 'Submit Assignment',
                      color: AppColors.white,
                    ),
                  ),
                  radius: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
