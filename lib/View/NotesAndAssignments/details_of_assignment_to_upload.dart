import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_management/View/NotesAndAssignments/assignment_showing_page.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/View/Widgets/extended_appbar.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';
import 'package:file_picker/file_picker.dart';

class DetailsOfAssignmentToUpload extends StatefulWidget {
  @override
  _DetailsOfAssignmentToUploadState createState() =>
      _DetailsOfAssignmentToUploadState();
}

class _DetailsOfAssignmentToUploadState
    extends State<DetailsOfAssignmentToUpload> {
  final DateTime dateTime = DateTime.now();
  List<DateTime?> assignmentStartEndDate = [null, null];
  List<String> filesUploadedName = [];

  List<File> filesUploaded = [];
  TextEditingController? titleController = TextEditingController();
  TextEditingController? marksController = TextEditingController();
  TextEditingController? noteController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              form(size, context),
            ],
          ),
        ),
      ),
    );
  }

  Form form(Size size, BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            CustomTextField(
              labelText: 'Assignment title *',
              textEditingController: this.titleController,
              validator: (value) {
                if (value == null || value == '')
                  return 'Please add valid title';
                return null;
              },
            ),
            CustomTextField(
              labelText: 'Maximum Marks',
              keyboardType: TextInputType.numberWithOptions(),
              textEditingController: this.marksController,
            ),
            dateSelection(size, context, 0, "Assigning Date"),
            dateSelection(size, context, 1, 'Submission Date'),
            CustomTextField(
              labelText: 'Add Notes',
              minLines: 5,
              maxLines: null,
              textEditingController: this.noteController,
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
              onTap: () async {
                print('Tapped');
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles(allowMultiple: true);
                if (result != null) {
                  List<File> files =
                      result.paths.map((path) => File(path!)).toList();
                  for (File file in files) {
                    filesUploaded.add(file);
                    filesUploadedName.add(file.path.split('/').last);
                  }
                  setState(() {});
                  print('Files: $filesUploaded and $filesUploadedName');
                } else {
                  // User canceled the picker
                }
              },
            ),
            Container(
              height: filesUploadedName.length == 0 ? 0 : 30,
              // flex:FlexFit.loose,
              child: ListView.builder(
                  itemCount: filesUploadedName.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SmallerText(
                      text: filesUploadedName[index],
                      color: AppColors.midnightBlue,
                    );
                  }),
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
                onTap: () {
                  print('validating');
                  if (_formKey.currentState!.validate()) {
                    print('validating in form ${this.titleController?.text}');
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => AssignmentShowingPage(
                          title: this.titleController?.text,
                          descrition: this.noteController?.text,
                          marks: this.marksController?.text,
                          submissionDate: this.assignmentStartEndDate[1],
                          filesUploaded: this.filesUploaded,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText(
                text: this.assignmentStartEndDate[date] == null
                    ? text
                    : this.assignmentStartEndDate[date]!.day.toString() +
                        '-' +
                        this.assignmentStartEndDate[date]!.month.toString() +
                        '-' +
                        this.assignmentStartEndDate[date]!.year.toString(),
              ),
              this.assignmentStartEndDate[date] == null
                  ? Icon(
                      Icons.calendar_today,
                      color: AppColors.midnightBlue,
                    )
                  : Container(),
            ],
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
                  child: Row(
                    children: [
                      Text('$text'),
                    ],
                  ),
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
