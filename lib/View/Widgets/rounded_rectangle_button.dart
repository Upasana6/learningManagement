import 'package:flutter/material.dart';
import 'package:learning_management/constants.dart';

class RoundedRectangleButton extends StatelessWidget {
  const RoundedRectangleButton({
    Key? key,
    required this.size,
    this.onTap,
    this.child,
    this.fillColor,
    this.borderColor,
    this.radius,
  }) : super(key: key);

  final Size size;
  final onTap;
  final Widget? child;
  final Color? fillColor;
  final Color? borderColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: this.fillColor ?? AppColors.white,
          border: Border.all(color: this.borderColor ?? AppColors.babyBlue),
          borderRadius: BorderRadius.all(
            Radius.circular(this.radius ?? 20),
          ),
        ),
        child: InkWell(
          onTap: this.onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: this.child,
          ),
        ),
      ),
    );
  }
}
