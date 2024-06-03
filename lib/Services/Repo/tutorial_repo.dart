// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:first_app/Models/tutorial_model.dart';
// import 'package:first_app/Services/globals.dart';
//
// class TutorialRepo {
//   static Future<void> getTutorial(
//       {required Function(List<Tutorial>) onSuccess,
//       required Function(String message) onError}) async {
//
//     try {
//       var url = Uri.parse(tutorialAPI);
//
//       http.Response response = await http.get(
//         url,
//         headers: headers,
//       );
//       var data = json.decode(response.body);
//
//       if (data['status']) {
//         onSuccess(tutorialFromJson(data['data']['tutorials']));
//       }
//     } catch (e) {
//       log('-->>>>$e');
//       onError('Sorry something went wrong. Please try again');
//     }
//   }
// }


// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:first_app/Models/tutorial_model.dart';
//
// class TutorialRepo {
//   static Future<void> getTutorial({
//     required Function(List<Tutorial>) onSuccess,
//     required Function(String message) onError,
//   }) async {
//     try {
//       QuerySnapshot querySnapshot =
//       await FirebaseFirestore.instance.collection('tutorials').get();
//       List<Tutorial> tutorials = querySnapshot.docs
//           .map((doc) => Tutorial.fromJson(doc.data() as Map<String, dynamic>))
//           .toList();
//       onSuccess(tutorials);
//     } catch (e) {
//       log('-->>>>$e');
//       onError('Sorry something went wrong. Please try again');
//     }
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:first_app/models/tutorial_model.dart';
//
// class TutorialRepo {
//   static Future<List<Tutorial>> getTutorials() async {
//     try {
//       QuerySnapshot querySnapshot =
//       await FirebaseFirestore.instance.collection('tutorials').get();
//       return querySnapshot.docs
//           .map((doc) => Tutorial.fromFirestore(doc))
//           .toList();
//     } catch (e) {
//       throw Exception('Failed to load tutorials: $e');
//     }
//   }
// }
// lib/models/tutorial_model.dart

// class Tutorial {
//   int? id;
//   String? title;
//   String? description;
//   String? videoLink;
//   List<Media>? media;
//
//   Tutorial({
//     this.id,
//     this.title,
//     this.description,
//     this.videoLink,
//     this.media,
//   });
//
//   factory Tutorial.fromJson(Map<String, dynamic> json) {
//     return Tutorial(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//       videoLink: json['videoLink'],
//       media: List<Media>.from(json['media'].map((x) => Media.fromJson(x))),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'description': description,
//       'videoLink': videoLink,
//       'media': media?.map((x) => x.toJson()).toList(),
//     };
//   }
//
//   // Generate YouTube preview URL
//   String getPreviewUrl() {
//     if (videoLink != null && videoLink!.contains("youtube.com")) {
//       final videoId = videoLink!.split("v=").last;
//       return 'https://img.youtube.com/vi/$videoId/0.jpg';
//     }
//     return media?.isNotEmpty == true ? media!.first.previewUrl ?? '' : '';
//   }
// }
//
// class Media {
//   String? originalUrl;
//   String? previewUrl;
//
//   Media({this.originalUrl, this.previewUrl});
//
//   factory Media.fromJson(Map<String, dynamic> json) {
//     return Media(
//       originalUrl: json['originalUrl'],
//       previewUrl: json['previewUrl'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'originalUrl': originalUrl,
//       'previewUrl': previewUrl,
//     };
//   }
// }

// lib/services/repo/tutorial_repo.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/models/tutorial_model.dart' as tm;

class TutorialRepo {
  static Future<List<tm.Tutorial>> getTutorials() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('tutorials').get();
      List<tm.Tutorial> tutorials = snapshot.docs.map((doc) {
        return tm.Tutorial.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return tutorials;
    } catch (e) {
      print(e);
      return [];
    }
  }
}



