import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

/// For viewing notes
class PdfViewer extends StatefulWidget {
  const PdfViewer({Key? key}) : super(key: key);

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  /// 0-> not tried opening, 1-> opened and -1-> cannot open
  int _isLoading = 0;

  PDFDocument _doc = PDFDocument();

  /// load PDF file i.e. for now notes
  void loadPdf() async {
    try {
      _doc = await PDFDocument.fromAsset('assets/pdf/Synopsis.pdf');
      setState(() {
        _isLoading = 1;
      });
      navigateToViewer();
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = -1;
      });
    }
  }

  Widget navigateToViewer() {
    _isLoading = 0;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Viewer(
          document: _doc,
        ),
      ),
    );
    return Container();
  }

  @override
  void initState() {
    loadPdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: _isLoading == 0
            ? Center(
                // TODO loader instead of container
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
              )
            // : _isLoading == 1
            // ? navigateToViewer()
            : Center(
                // TODO alert dialogue box instead of Text
                child: Text(
                  'Cannot open this file!!',
                ),
              ),
      ),
    );
  }
}

/// Shows pdf in new page
class Viewer extends StatelessWidget {
  Viewer({this.document});
  final PDFDocument? document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Container(
        child: PDFViewer(
          document: document!,
        ),
      ),
    );
  }
}
