import 'package:flutter/material.dart';
import 'package:learning_management/constants.dart';

class AppbarWithBackAndMenu extends StatelessWidget {
  AppbarWithBackAndMenu({
    required this.size,
    this.buttonColor,
    this.backgroundColor,
    this.onBackButtonTap,
    this.onMenuButtonTap,
  });

  final Size size;
  final Color? buttonColor;
  final Color? backgroundColor;
  final Function()? onBackButtonTap;
  final Function()? onMenuButtonTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: this.backgroundColor ?? Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 28,
                color: this.buttonColor ?? AppColors.midnightBlue,
              ),
              onPressed: onBackButtonTap,
            ),
            IconButton(
              icon: Icon(
                Icons.menu,
                size: 28,
                color: this.buttonColor ?? AppColors.midnightBlue,
              ),
              onPressed: this.onMenuButtonTap,
            ),
          ],
        ),
      ),
    );
  }
}
