// List<Notice> noticeFromJson(
//     List<dynamic> noticeJson) =>
//     List<Notice>.from(noticeJson.map((noticeJson) =>
//         Notice.fromJson(noticeJson)));
//
// class Notice {
//   int? id;
//   String? title;
//   String? description;
//   String? nepaliTitle;
//   String? nepaliDescription;
//   String? link;
//   String? updatedAt;
//
//   Notice(
//       {this.id,
//         this.title,
//         this.description,
//         this.nepaliTitle,
//         this.nepaliDescription,
//         this.link,
//         this.updatedAt});
//
//   Notice.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     nepaliTitle = json['nepaliTitle'];
//     nepaliDescription = json['nepaliDescription'];
//     link = json['link'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['description'] = description;
//     data['nepaliTitle'] = nepaliTitle;
//     data['nepaliDescription'] = nepaliDescription;
//     data['link'] = link;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Notice {
//   int? id; // Firebase document ID
//   String? title;
//   String? description;
//   String? link;
//   String? updatedAt;
//
//   Notice({
//     this.id,
//     this.title,
//     this.description,
//     this.link,
//     this.updatedAt,
//   });
//
//   // Convert Firestore document snapshot to Notice object
//   factory Notice.fromSnapshot(DocumentSnapshot snapshot) {
//     Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//     return Notice(
//       id: int.parse(snapshot.id),
//       title: data['title'],
//       description: data['description'],
//       link: data['link'],
//       updatedAt: data['updated_at'],
//     );
//   }
//
//   // Convert Notice object to JSON map for Firestore
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'description': description,
//       'link': link,
//       'updated_at': updatedAt,
//     };
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class Notice {
  int? id;
  String? title;
  String? description;
  String? nepaliTitle;
  String? nepaliDescription;
  String? link;
  Timestamp? updatedAt;

  Notice({
    this.id,
    this.title,
    this.description,
    this.nepaliTitle,
    this.nepaliDescription,
    this.link,
    this.updatedAt,
  });

  // Define the fromSnapshot factory constructor to create Notice objects from Firestore document snapshots
  factory Notice.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Notice(
      id: data['id'] as int?,
      title: data['title'] as String?,
      description: data['description'] as String?,
      nepaliTitle: data['nepaliTitle'] as String?,
      nepaliDescription: data['nepaliDescription'] as String?,
      link: data['link'] as String?,
      updatedAt: data['updatedAt'] as Timestamp?, // Assuming updatedAt is stored as a String in Firestore
    );
  }

  // Define the toJson method to convert Notice objects to a map for Firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'nepaliTitle': nepaliTitle,
      'nepaliDescription': nepaliDescription,
      'link': link,
      'updatedAt': updatedAt,
    };
  }
}



