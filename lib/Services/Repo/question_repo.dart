// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:first_app/Services/globals.dart';
// import 'package:first_app/Models/question_model.dart';
//
// class QuestionRepo {
//   static Future<void> getQuestion(
//       {required Function(List<Question>) onSuccess,
//       required Function(String message) onError}) async {
//
//     try {
//       var url = Uri.parse(questionAPI);
//
//       http.Response response = await http.get(
//         url,
//         headers: headers,
//       );
//
//       var data = json.decode(response.body);
//
//       if (data['status']) {
//         onSuccess(questionFromJson(data['data']['questions']));
//       }
//
//     } catch (e) {
//       log('-->>>>$e');
//       onError('Sorry something went wrong. Please try again');
//     }
//   }
// }


import 'package:first_app/Models/question_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionRepo {
  static Future<void> getQuestion(
      {required Function(List<Question>) onSuccess,
        required Function(String message) onError}) async {
    try {
      QuerySnapshot questionSnapshot =
      await FirebaseFirestore.instance.collection('questions').limit(25).get();
      List<Question> questions = questionSnapshot.docs
          .map((doc) => Question.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      onSuccess(questions);
    } catch (e) {
      print('Error fetching questions: $e');
      onError('Sorry, something went wrong. Please try again.');
    }
  }
}


