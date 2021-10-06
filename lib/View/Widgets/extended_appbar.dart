import 'package:flutter/material.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class ExtendedAppbar extends StatelessWidget {
  ExtendedAppbar({
    required this.size,
    this.title = '',
    this.subtitle,
  });

  final Size size;
  final String title;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size.height * 0.25,
      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.midnightBlue,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BigText(
              text: this.title,
              color: AppColors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              bottom: 21,
            ),
            child: this.subtitle,
          ),
        ],
      ),
    );
  }
}
