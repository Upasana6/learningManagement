import 'package:flutter/material.dart';
import 'package:learning_management/View/Attendence/attendence_uploading.dart';
import 'package:learning_management/View/NotesAndAssignments/details_of_assignment_to_upload.dart';
import 'package:learning_management/View/Quiz/quiz_upload.dart';
import 'package:learning_management/View/Quiz/show_quiz.dart';
import 'package:learning_management/View/Quiz/take_quiz.dart';
import 'package:learning_management/View/class_detail_for_teacher.dart';
import 'package:learning_management/View/classes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /// Splash Page will be called here
      // home: PdfViewer(),
      // home: ClassDetailForTeacher(),
      // home: DetailsOfAssignmentToUpload(),
      // home: QuizUpload(),
      // home: ShowQuiz(),
      home: TakeQuiz(),
    );
  }
}
