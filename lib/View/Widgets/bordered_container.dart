import 'package:flutter/material.dart';
import 'package:learning_management/constants.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.midnightBlue,
          width: 3,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: this.child,
      ),
    );
  }
}
