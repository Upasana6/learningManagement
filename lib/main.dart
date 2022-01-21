import 'package:flutter/material.dart';
import 'package:learning_management/View/Attendence/attendence_uploading.dart';
import 'package:learning_management/View/NotesAndAssignments/details_of_assignment_to_upload.dart';
import 'package:learning_management/View/Quiz/quiz_upload.dart';
import 'package:learning_management/View/Quiz/show_quiz.dart';
import 'package:learning_management/View/Quiz/take_quiz.dart';
import 'package:learning_management/View/Quiz/test_submit.dart';
import 'package:learning_management/View/class_detail_for_teacher.dart';
import 'package:learning_management/View/classes.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext comtext) {
    return SplashScreen(
      seconds: 2,
      backgroundColor: Colors.white,
      // image: Image.asset('assets/imp.png'),
      loaderColor: Colors.black,
      photoSize: 150.0,
      navigateAfterSeconds: QuizUpload(),
    );
  }
}
