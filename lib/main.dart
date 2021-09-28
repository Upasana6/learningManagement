import 'package:flutter/material.dart';
import 'package:learning_management/View/Notes/notes_upload.dart';

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
      home: NotesUpload(),
    );
  }
}
