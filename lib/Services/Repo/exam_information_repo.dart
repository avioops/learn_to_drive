// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:first_app/Services/globals.dart';
// import 'package:first_app/Models/exam_information_model.dart';
//
// class ExamInformationRepo {
//   static Future<void> getExamInformation(
//       {required Function(List<ExamInformation>) onSuccess,
//       required Function(String message) onError}) async {
//     try {
//       var url = Uri.parse(examInformationAPI);
//
//       http.Response response = await http.get(
//         url,
//         headers: headers,
//       );
//       var data = json.decode(response.body);
//       if (data['status']) {
//         onSuccess(examInformationFromJson(data['data']['examInformations']));
//       }
//     } catch (e) {
//       log('-->>>>$e');
//       onError('Sorry something went wrong. Please try again');
//     }
//   }
// }


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/Models/exam_information_model.dart';

class ExamInformationRepo {
  static Future<void> getExamInformation({
    required Function(List<ExamInformation>) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('examInformation').get();
      List<ExamInformation> examInformations = [];
      querySnapshot.docs.forEach((doc) {
        // Explicitly cast doc.data() to Map<String, dynamic>
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        examInformations.add(ExamInformation.fromJson(data));
      });
      onSuccess(examInformations);
    } catch (e) {
      log('-->>>>$e');
      onError('Sorry something went wrong. Please try again');
    }
  }
}





