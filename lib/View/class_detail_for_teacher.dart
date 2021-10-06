import 'package:flutter/material.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/View/Widgets/extended_appbar.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class ClassDetailForTeacher extends StatelessWidget {
  const ClassDetailForTeacher({Key? key}) : super(key: key);

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
              buttonColor: AppColors.wheatish,
            ),
            ExtendedAppbar(
              size: size,
              title: 'SPM',
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MediumText(
                        text: '10',
                        color: AppColors.white,
                      ),
                      SmallText(
                        text: 'Students',
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MediumText(
                        text: '10',
                        color: AppColors.white,
                      ),
                      SmallText(
                        text: 'Assignments',
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MediumText(
                        text: '10',
                        color: AppColors.white,
                      ),
                      SmallText(
                        text: 'Tests',
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
