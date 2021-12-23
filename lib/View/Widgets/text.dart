import 'package:flutter/material.dart';
import 'package:learning_management/constants.dart';

class VeryBigText extends StatelessWidget {
  VeryBigText({
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
        fontSize: 30,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  MediumText({
    this.text = '',
    this.color,
    this.textAlign,
  });
  final String text;
  final TextAlign? textAlign;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      textAlign: this.textAlign ?? TextAlign.start,
      style: TextStyle(
        color: this.color ?? AppColors.midnightBlue,
        fontSize: 20,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  SmallText({
    this.text = '',
    this.color,
    this.textAlign,
  });
  final String text;
  final TextAlign? textAlign;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      textAlign: this.textAlign ?? TextAlign.start,
      style: TextStyle(
        color: this.color ?? AppColors.midnightBlue,
        fontSize: 16,
      ),
    );
  }
}

class SmallerText extends StatelessWidget {
  SmallerText({this.text = '', this.color, this.textAlign});
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      textAlign: this.textAlign ?? TextAlign.start,
      style: TextStyle(
        color: this.color ?? AppColors.wheatish,
        fontSize: 14,
      ),
    );
  }
}
