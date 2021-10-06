import 'package:flutter/material.dart';
import 'package:learning_management/constants.dart';

class BigText extends StatelessWidget {
  BigText({
    this.text = '',
    this.color,
  });
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        color: this.color ?? AppColors.midnightBlue,
        fontSize: 40,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  MediumText({
    this.text = '',
    this.color,
  });
  final String text;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        color: this.color ?? AppColors.midnightBlue,
        fontSize: 21,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  SmallText({
    this.text = '',
    this.color,
  });
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        color: this.color ?? AppColors.wheatish,
        fontSize: 14,
      ),
    );
  }
}
