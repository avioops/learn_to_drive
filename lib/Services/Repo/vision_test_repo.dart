// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:first_app/Services/globals.dart';
// import '../../Models/vision_test.dart';
//
// class VisionTestRepo {
//   static Future<void> getVisionTest(
//       {required Function(List<VisionTest>) onSuccess,
//       required Function(String message) onError}) async {
//
//     try {
//       var url = Uri.parse(visionTestAPI);
//
//       http.Response response = await http.get(
//         url,
//         headers: headers,
//       );
//       var data = json.decode(response.body);
//
//       if (data['status']) {
//         onSuccess(visionTestFromJson(data['data']['visionTests']));
//       }
//     } catch (e) {
//       log('-->>>>$e');
//       onError('Sorry something went wrong. Please try again');
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/Models/vision_test.dart';

class VisionTestRepo {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> getVisionTest({
    required Function(List<VisionTest>) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      QuerySnapshot querySnapshot =
      await _firestore.collection('vision_tests').get();

      List<VisionTest> visionTests = querySnapshot.docs
          .map((doc) => VisionTest.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();

      onSuccess(visionTests);
    } catch (e) {
      print('-->>>>$e');
      onError('Sorry something went wrong. Please try again');
    }
  }
}
