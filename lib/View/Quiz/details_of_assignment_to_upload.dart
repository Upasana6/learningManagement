import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/View/Widgets/extended_appbar.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class DetailsOfAssignmentToUpload extends StatefulWidget {
  @override
  _DetailsOfAssignmentToUploadState createState() =>
      _DetailsOfAssignmentToUploadState();
}

class _DetailsOfAssignmentToUploadState
    extends State<DetailsOfAssignmentToUpload> {
  final DateTime dateTime = DateTime.now();
  List<DateTime?> assignmentStartEndDate = [null, null];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarWithBackAndMenu(
                size: size,
                buttonColor: AppColors.white,
                backgroundColor: AppColors.midnightBlue,
              ),
              ExtendedAppbar(
                size: size,
                title: 'SPM IT 7th SEM',
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    CustomTextField(labelText: 'Assignment title'),
                    CustomTextField(
                      labelText: 'Maximum Marks',
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                    dateSelection(size, context, 0, "Assigning Date"),
                    dateSelection(size, context, 1, 'Submission Date'),
                    CustomTextField(
                      labelText: 'Add Notes',
                      minLines: 5,
                      maxLines: null,
                    ),
                    RoundedRectangleButton(
                      size: size,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MediumText(
                            text: 'Add Attachment',
                          ),
                          Icon(Icons.download),
                        ],
                      ),
                      onTap: () {
                        // TODO take file input
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: RoundedRectangleButton(
                        size: size,
                        // text: 'Upload Assignment',
                        child: Center(
                          child: MediumText(
                            text: 'Upload Assignment',
                            color: AppColors.white,
                          ),
                        ),
                        fillColor: AppColors.midnightBlue,
                        radius: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate(context, int date) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: this.dateTime,
      firstDate: this.dateTime,
      lastDate: DateTime(this.dateTime.year + 1),
    );
    if (pickedDate != null && pickedDate != this.assignmentStartEndDate[date])
      setState(() {
        this.assignmentStartEndDate[date] = pickedDate;
        print(pickedDate);
      });
  }

  Stack dateSelection(Size size, BuildContext context, int date, String text) {
    return Stack(
      children: [
        RoundedRectangleButton(
          size: size,
          // assignmentDate: assignmentStartEndDate[date],
          onTap: () {
            _selectDate(context, date);
          },
          child: MediumText(
            text: this.assignmentStartEndDate[date] == null
                ? text
                : this.assignmentStartEndDate[date]!.day.toString() +
                    '-' +
                    this.assignmentStartEndDate[date]!.month.toString() +
                    '-' +
                    this.assignmentStartEndDate[date]!.year.toString(),
          ),
          // text: text,
        ),
        this.assignmentStartEndDate[date] != null
            ? Positioned(
                top: -2,
                left: 16,
                child: Container(
                  color: AppColors.white,
                  // padding: EdgeInsets.symmetric(horizontal: ),
                  child: Text(text),
                ),
              )
            : Container(),
      ],
    );
  }
}

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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.labelText = '',
    this.keyboardType,
    this.borderColor,
    this.textColor,
    this.maxLines,
    this.enabled = true,
    this.minLines,
  });
  final String labelText;
  final TextInputType? keyboardType;
  final Color? textColor;
  final Color? borderColor;
  final int? maxLines;
  final bool enabled;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
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
      ),
    );
  }
}
