import 'package:flutter/material.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/constants.dart';

class AddQuestions extends StatelessWidget {
  const AddQuestions({Key? key}) : super(key: key);

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
            )
          ],
        ),
      ),
    );
  }
}
