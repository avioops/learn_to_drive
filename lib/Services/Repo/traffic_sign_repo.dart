// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:first_app/Services/globals.dart';
// import '../../Models/traffic_sign.dart';
//
// class TrafficSignRepo {
//   static Future<void> getTrafficSign(
//       {required Function(List<TrafficSign>) onSuccess,
//       required Function(String message) onError}) async {
//     try {
//       var url = Uri.parse(trafficSignAPI);
//       http.Response response = await http.get(
//         url,
//         headers: headers,
//       );
//       var data = json.decode(response.body);
//
//       // print('----------->>>>>>>>>>$data');
//       if (data['status']) {
//         // print(trafficSignFromJson(data['data']['categories']));
//         onSuccess(trafficSignFromJson(data['data']['trafficSigns']));
//       }
//     } catch (e) {
//       log('-->>>>$e');
//       onError('Sorry something went wrong. Please try again');
//     }
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:first_app/Models/traffic_sign.dart';
//
// class TrafficSignRepo {
//   static Future<void> getTrafficSign({
//     required Function(List<TrafficSign>) onSuccess,
//     required Function(String message) onError,
//   }) async {
//     try {
//       QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('traffic_signs').get();
//       List<TrafficSign> trafficSignList = snapshot.docs.map((doc) => TrafficSign.fromJson(doc.data() as Map<String, dynamic>)).toList();
//       onSuccess(trafficSignList);
//     } catch (e) {
//       onError('Sorry something went wrong. Please try again.');
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/Models/traffic_sign.dart';

class TrafficSignRepo {
  static Future<void> getTrafficSign({
    required Function(List<TrafficSign>) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('traffic_signs').get();
      List<TrafficSign> trafficSignList = snapshot.docs.map((doc) => TrafficSign.fromJson(doc.data() as Map<String, dynamic>)).toList();
      onSuccess(trafficSignList);
    } catch (e) {
      onError('Sorry something went wrong. Please try again.');
    }
  }
}

