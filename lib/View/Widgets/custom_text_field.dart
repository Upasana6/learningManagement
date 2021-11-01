import 'package:flutter/material.dart';
import 'package:learning_management/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.labelText = '',
    this.keyboardType,
    this.borderColor,
    this.textColor,
    this.maxLines,
    this.enabled = true,
    this.minLines,
    @required this.textEditingController,
    this.validator,
  });
  final String labelText;
  final TextInputType? keyboardType;
  final Color? textColor;
  final Color? borderColor;
  final int? maxLines;
  final bool enabled;
  final int? minLines;
  final TextEditingController? textEditingController;
  final validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        controller: this.textEditingController,
        minLines: this.minLines ?? 1,
        enabled: this.enabled,
        keyboardType: this.keyboardType ?? TextInputType.text,
        cursorColor: AppColors.babyBlue,
        maxLines: maxLines,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: this.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              // color: AppColors.midnightBlue,
              color: this.borderColor ?? Colors.black,
              width: 1,
            ),
          ),
          labelStyle: TextStyle(
            color: this.textColor ?? AppColors.midnightBlue,
            fontSize: 18,
          ),
        ),
        style: TextStyle(
          color: this.textColor ?? AppColors.midnightBlue,
          fontSize: 18,
        ),
        validator: this.validator,
        // onChanged: (value) {
        //   // textEditingController?.text = value;
        // },
      ),
    );
  }
}
