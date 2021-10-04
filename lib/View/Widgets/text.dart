import 'package:flutter/material.dart';
import 'package:learning_management/constants.dart';

class BigText extends StatelessWidget {
  BigText({
    this.text = '',
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        color: AppColors.midnightBlue,
        fontSize: 40,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  MediumText({this.text = ''});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        color: AppColors.midnightBlue,
        fontSize: 21,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  SmallText({
    this.text = '',
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        color: AppColors.wheatish,
        fontSize: 14,
      ),
    );
  }
}
