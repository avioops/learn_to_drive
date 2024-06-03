// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:first_app/Models/notice_model.dart';
// import 'package:first_app/Services/globals.dart';
//
// class NoticeRepo {
//   static Future<void> getNotice(
//       {required Function(List<Notice>) onSuccess,
//         required Function(String message) onError}) async {
//     try {
//       var url = Uri.parse(noticeAPI);
//
//       http.Response response = await http.get(
//         url,
//         headers: headers,
//       );
//       var data = json.decode(response.body);
//
//       if (data['status']) {
//         onSuccess(noticeFromJson(data['data']['notices']));
//       }
//     } catch (e) {
//       log('-->>>>$e');
//       onError('Sorry something went wrong. Please try again');
//     }
//   }
// }

import 'dart:developer';
import 'package:first_app/models/notice_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeRepo {
  static Future<void> getNotice({
    required Function(List<Notice>) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('notices').get();

      List<Notice> notices = snapshot.docs
          .map((doc) => Notice.fromSnapshot(doc))
          .toList();

      onSuccess(notices);
    } catch (e) {
      log('Error fetching notices: $e');
      onError('Sorry, something went wrong. Please try again.');
    }
  }
}

// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:first_app/Models/notice_model.dart';
//
// class NoticeRepo {
//   static void getNotice({
//     required Function(List<Notice>) onSuccess,
//     required Function(String) onError,
//   }) {
//     try {
//       // Get a reference to the 'notices' collection
//       CollectionReference noticesRef = FirebaseFirestore.instance.collection('notices');
//
//       // Create a real-time listener for the 'notices' collection
//       noticesRef.snapshots().listen((QuerySnapshot snapshot) {
//         // Map the documents in the snapshot to Notice objects
//         List<Notice> notices = snapshot.docs.map((doc) => Notice.fromSnapshot(doc)).toList();
//
//         // Call the onSuccess callback with the fetched notices
//         onSuccess(notices);
//       });
//     } catch (e) {
//       // Log any errors and call the onError callback
//       log('Error fetching notices: $e');
//       onError('Sorry, something went wrong. Please try again.');
//     }
//   }
// }



