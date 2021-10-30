import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:learning_management/View/NotesAndAssignments/details_of_assignment_to_upload.dart';
import 'package:learning_management/View/NotesAndAssignments/pdf_viewer.dart';
import 'package:learning_management/View/Widgets/appbar_with_back_and_menu.dart';
import 'package:learning_management/View/Widgets/extended_appbar.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class AssignmentShowingPage extends StatefulWidget {
  AssignmentShowingPage({
    @required this.title,
    this.filesUploaded,
    this.descrition,
    this.marks,
    this.submissionDate,
  });
  final List<File>? filesUploaded;
  final String? title;
  final String? descrition;
  final String? marks;
  final DateTime? submissionDate;

  @override
  _AssignmentShowingPageState createState() => _AssignmentShowingPageState();
}

class _AssignmentShowingPageState extends State<AssignmentShowingPage> {
  /// 0-> not tried opening, 1-> opened and -1-> cannot open, 2-> opening
  int _isPdfLoading = 0;

  PDFDocument _doc = PDFDocument();

  /// load PDF file i.e. for now notes
  void loadPdf(pdfToOpen) async {
    try {
      // _doc = await PDFDocument.fromAsset('assets/pdf/Synopsis.pdf');
      // sleep(Duration(seconds: 2));
      _doc = await PDFDocument.fromFile(pdfToOpen);
      setState(() {
        _isPdfLoading = 1;
      });
      navigateToViewer();
    } catch (e) {
      print(e);
      setState(() {
        _isPdfLoading = -1;
      });
    }
  }

  void navigateToViewer() {
    _isPdfLoading = 0;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Viewer(
          document: _doc,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarWithBackAndMenu(
              size: size,
              backgroundColor: AppColors.midnightBlue,
              buttonColor: AppColors.white,
            ),
            ExtendedAppbar(
              size: size,
              title: this.widget.title ?? '',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SmallText(
                        text: '${this.widget.descrition}',
                        color: AppColors.midnightBlue,
                        textAlign: TextAlign.justify,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SmallText(
                          text: 'Marks: ${this.widget.marks ?? '__'}',
                          textAlign: TextAlign.end,
                          color: AppColors.redish,
                        ),
                      ),
                      Container(
                        height: size.height / 2.3,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: this.widget.filesUploaded?.length,
                          itemBuilder: (context, int index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _isPdfLoading = 2;
                                });
                                loadPdf(this.widget.filesUploaded![index]);
                              },
                              child: Container(
                                height: size.width / 3 - 50,
                                width: size.width / 2 - 50,
                                color: AppColors.babyBlue,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: size.width,
                                    color: AppColors.greyish?.withOpacity(0.7),
                                    child: SmallText(
                                      text: widget.filesUploaded!.isNotEmpty
                                          ? this
                                              .widget
                                              .filesUploaded![index]
                                              .path
                                              .split('/')
                                              .last
                                          : 'Error getting file',
                                      textAlign: TextAlign.center,
                                      color: AppColors.wheatish,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                bottom: 32,
                right: 32,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RoundedRectangleButton(
                  size: size,
                  fillColor: AppColors.midnightBlue,
                  borderColor: AppColors.midnightBlue,
                  child: Center(
                    child: MediumText(
                      text: 'Submit Assignment',
                      color: AppColors.white,
                    ),
                  ),
                  radius: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
