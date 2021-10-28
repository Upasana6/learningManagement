import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

/// For uploading notes (by teacher)
class NotesUpload extends StatefulWidget {
  const NotesUpload({Key? key}) : super(key: key);

  @override
  _NotesUploadState createState() => _NotesUploadState();
}

class _NotesUploadState extends State<NotesUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
