import 'package:flutter/material.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/View/Widgets/bordered_container.dart';
import 'package:learning_management/View/Widgets/extended_appbar.dart';
import 'package:learning_management/View/Widgets/rounded_rectangle_button.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class AttendenceUploading extends StatefulWidget {
  const AttendenceUploading({Key? key}) : super(key: key);

  @override
  State<AttendenceUploading> createState() => _AttendenceUploadingState();
}

class _AttendenceUploadingState extends State<AttendenceUploading> {
  final DateTime dateTime = DateTime.now();
  DateTime testDate = DateTime.now();
  List<bool> presence = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                AppbarWithBackAndMenu(
                  size: size,
                  backgroundColor: AppColors.midnightBlue,
                  buttonColor: AppColors.white,
                ),
                ExtendedAppbar(
                  size: size,
                  title: 'SPM IT',
                  subtitle: SmallText(
                    text: 'Attendence',
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 12,
              ),
              child: dateSelection(size, context),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: BorderedContainer(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                MediumText(
                                  text: 'UE188109',
                                ),
                                SmallText(
                                  text: 'Upasana',
                                ),
                              ],
                            ),
                            Switch(
                              value: this.presence[index],
                              onChanged: (val) {
                                this.presence[index] = !this.presence[index];
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 32,
              ),
              child: RoundedRectangleButton(
                size: size,
                fillColor: AppColors.midnightBlue,
                borderColor: AppColors.midnightBlue,
                child: Center(
                  child: MediumText(
                    text: 'DONE',
                    color: AppColors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _selectDate(context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: this.dateTime,
      firstDate: DateTime(this.dateTime.year - 1),
      lastDate: this.dateTime,
    );
    if (pickedDate != null && pickedDate != this.testDate)
      setState(() {
        this.testDate = pickedDate;
        print(pickedDate);
      });
  }

  Stack dateSelection(Size size, BuildContext context) {
    return Stack(
      children: [
        RoundedRectangleButton(
          size: size,
          // assignmentDate: assignmentStartEndDate[date],
          onTap: () {
            _selectDate(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText(
                text: this.testDate.day.toString() +
                    '-' +
                    this.testDate.month.toString() +
                    '-' +
                    this.testDate.year.toString(),
              ),
              Icon(
                Icons.calendar_today,
                color: AppColors.midnightBlue,
              ),
            ],
          ),
          // text: text,
        ),
      ],
    );
  }
}
