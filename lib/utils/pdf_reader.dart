// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:developer';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:first_app/utils/widgets/screens_app_bar.dart';
//
// class PdfReaderScreen extends StatelessWidget {
//   final String title;
//   final String url;
//
//   const PdfReaderScreen({
//     Key? key,
//     required this.title,
//     required this.url,
//   }) : super(key: key);
//
//   Future<void> launchInBrowser(String url) async {
//     try {
//       final Uri toLaunch = Uri.parse(url);
//       await launchUrl(toLaunch, mode: LaunchMode.externalApplication);
//     } catch (e) {
//       log("Could not launch ------->");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar : ScreensAppBar(
//           title: title,
//           onPressed: (){
//             Get.back();
//           },
//           action: IconButton(
//             icon: const Icon(
//               Icons.download,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               launchInBrowser(url);
//             },
//           )
//         ),
//
//         body : SfPdfViewer.network(url),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
//
// class PdfReaderScreen extends StatefulWidget {
//   final String title;
//   final String url;
//
//   PdfReaderScreen({required this.title, required this.url});
//
//   @override
//   _PdfReaderScreenState createState() => _PdfReaderScreenState();
// }
//
// class _PdfReaderScreenState extends State<PdfReaderScreen> {
//   String? localPath;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadPdfFromUrl(widget.url);
//   }
//
//   Future<void> _loadPdfFromUrl(String url) async {
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final bytes = response.bodyBytes;
//         final dir = await getTemporaryDirectory();
//         final file = File('${dir.path}/temp.pdf');
//
//         await file.writeAsBytes(bytes, flush: true);
//         setState(() {
//           localPath = file.path;
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load PDF');
//       }
//     } catch (e) {
//       print('Error loading PDF: $e');
//       setState(() {
//         isLoading = false;
//       });
//       // Show error message to the user
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : localPath != null
//           ? SfPdfViewer.file(File(localPath!))
//           : Center(child: Text('Failed to load PDF')),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class PdfReaderScreen extends StatelessWidget {
//   final String title;
//   final String pdfFilename;
//
//   const PdfReaderScreen({
//     Key? key,
//     required this.title,
//     required this.pdfFilename,
//   }) : super(key: key);
//
//   Future<void> _loadPdf(BuildContext context) async {
//     try {
//       final String pdfUrl =
//       await FirebaseStorage.instance.ref().child(pdfFilename).getDownloadURL();
//
//       Get.to(() => Scaffold(
//         appBar: AppBar(title: Text(title)),
//         body: SfPdfViewer.network(pdfUrl),
//       ));
//     } catch (e) {
//       print('Error loading PDF: $e');
//       // Handle error
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () => Get.back(),
//           ),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () => _loadPdf(context),
//             child: Text('Load PDF'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class PdfReaderScreen extends StatelessWidget {
//   final String title;
//   final String pdfFilename;
//
//   const PdfReaderScreen({
//     Key? key,
//     required this.title,
//     required this.pdfFilename,
//   }) : super(key: key);
//
//   Future<void> _loadPdf(BuildContext context) async {
//     try {
//       // Get a reference to the specific PDF file
//       final ref = FirebaseStorage.instance.ref().child(pdfFilename);
//
//       // Get the download URL for the PDF file
//       final String pdfUrl = await ref.getDownloadURL();
//
//       // Navigate to the PDF viewer screen and load the PDF using the download URL
//       Get.to(() => Scaffold(
//         appBar: AppBar(title: Text(title)),
//         body: SfPdfViewer.network(pdfUrl),
//       ));
//     } catch (e) {
//       print('Error loading PDF: $e');
//       // Handle error
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () => Get.back(),
//           ),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () => _loadPdf(context),
//             child: Text('Load PDF'),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PdfReaderScreen extends StatelessWidget {
  final String title;
  final String pdfFilename;

  const PdfReaderScreen({
    Key? key,
    required this.title,
    required this.pdfFilename,
  }) : super(key: key);

  Future<void> _loadPdf(BuildContext context) async {
    try {
      // Generate the download URL for the file
      final String pdfUrl = await FirebaseStorage.instance.ref().child(pdfFilename).getDownloadURL();

      // Navigate to the PDF viewer screen
      Get.to(() => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: SfPdfViewer.network(pdfUrl),
      ));
    } catch (e) {
      print('Error loading PDF: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => _loadPdf(context),
            child: Text('Load PDF'),
          ),
        ),
      ),
    );
  }
}




