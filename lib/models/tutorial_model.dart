// List<Tutorial> tutorialFromJson(
//         List<dynamic> tutorialJson) =>
//     List<Tutorial>.from(tutorialJson.map((tutorialJson) =>
//         Tutorial.fromJson(tutorialJson)));
//
// class Tutorial {
//   int? id;
//   String? title;
//   String? description;
//   String? videoLink;
//   List<Media>? media;
//
//   Tutorial(
//       {this.id,
//       this.title,
//       this.description,
//       this.videoLink,
//       this.media});
//
//   Tutorial.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     videoLink = json['videoLink'];
//     if (json['media'] != null) {
//       media = <Media>[];
//       json['media'].forEach((v) {
//         media!.add(Media.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['description'] = description;
//     data['videoLink'] = videoLink;
//     if (media != null) {
//       data['media'] = media!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Media {
//   int? id;
//   String? modelType;
//   int? modelId;
//   String? uuid;
//   String? collectionName;
//   String? name;
//   String? fileName;
//   String? mimeType;
//   String? disk;
//   String? conversionsDisk;
//   int? size;
//   List<void>? manipulations;
//   List<void>? customProperties;
//   List<void>? generatedConversions;
//   List<void>? responsiveImages;
//   int? orderColumn;
//   String? createdAt;
//   String? updatedAt;
//   String? originalUrl;
//   String? previewUrl;
//
//   Media(
//       {this.id,
//       this.modelType,
//       this.modelId,
//       this.uuid,
//       this.collectionName,
//       this.name,
//       this.fileName,
//       this.mimeType,
//       this.disk,
//       this.conversionsDisk,
//       this.size,
//       this.manipulations,
//       this.customProperties,
//       this.generatedConversions,
//       this.responsiveImages,
//       this.orderColumn,
//       this.createdAt,
//       this.updatedAt,
//       this.originalUrl,
//       this.previewUrl});
//
//   Media.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     modelType = json['model_type'];
//     modelId = json['model_id'];
//     uuid = json['uuid'];
//     collectionName = json['collection_name'];
//     name = json['name'];
//     fileName = json['file_name'];
//     mimeType = json['mime_type'];
//     disk = json['disk'];
//     conversionsDisk = json['conversions_disk'];
//     size = json['size'];
//     orderColumn = json['order_column'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     originalUrl = json['original_url'];
//     previewUrl = json['preview_url'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['model_type'] = modelType;
//     data['model_id'] = modelId;
//     data['uuid'] = uuid;
//     data['collection_name'] = collectionName;
//     data['name'] = name;
//     data['file_name'] = fileName;
//     data['mime_type'] = mimeType;
//     data['disk'] = disk;
//     data['conversions_disk'] = conversionsDisk;
//     data['size'] = size;
//     data['order_column'] = orderColumn;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['original_url'] = originalUrl;
//     data['preview_url'] = previewUrl;
//     return data;
//   }
// }

// import 'dart:convert';
//
// List<Tutorial> tutorialFromJson(List<dynamic> tutorialJson) =>
//     List<Tutorial>.from(tutorialJson.map((tutorialJson) =>
//         Tutorial.fromJson(tutorialJson)));
//
// class Tutorial {
//   int? id;
//   String? title;
//   String? description;
//   String? videoLink;
//   List<Media>? media;
//
//   Tutorial({this.id, this.title, this.description, this.videoLink, this.media});
//
//   Tutorial.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     videoLink = json['videoLink'];
//     if (json['media'] != null) {
//       media = <Media>[];
//       json['media'].forEach((v) {
//         media!.add(Media.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['description'] = description;
//     data['videoLink'] = videoLink;
//     if (media != null) {
//       data['media'] = media!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Media {
//   String? originalUrl;
//   String? previewUrl;
//
//   Media({this.originalUrl, this.previewUrl});
//
//   Media.fromJson(Map<String, dynamic> json) {
//     originalUrl = json['original_url'];
//     previewUrl = json['preview_url'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['original_url'] = originalUrl;
//     data['preview_url'] = previewUrl;
//     return data;
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Tutorial {
//   String? id;
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
//   factory Tutorial.fromFirestore(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     return Tutorial(
//       id: doc.id,
//       title: data['title'],
//       description: data['description'],
//       videoLink: data['videoLink'],
//       media: List<Media>.from(data['media'].map((x) => Media.fromJson(x))),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'description': description,
//       'videoLink': videoLink,
//       'media': media?.map((x) => x.toJson()).toList(),
//     };
//   }
// }
//
// class Media {
//   String? originalUrl;
//   String? previewUrl;
//
//   Media({
//     this.originalUrl,
//     this.previewUrl,
//   });
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

// lib/models/tutorial_model.dart

class Tutorial {
  int? id;
  String? title;
  String? description;
  String? videoLink;
  List<Media>? media;

  Tutorial({
    this.id,
    this.title,
    this.description,
    this.videoLink,
    this.media,
  });

  factory Tutorial.fromJson(Map<String, dynamic> json) {
    return Tutorial(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      videoLink: json['videoLink'],
      media: List<Media>.from(json['media'].map((x) => Media.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'videoLink': videoLink,
      'media': media?.map((x) => x.toJson()).toList(),
    };
  }

  // Generate YouTube preview URL
//   String getPreviewUrl() {
//     if (videoLink != null && videoLink!.contains("youtube.com")) {
//       final videoId = videoLink!.split("v=").last;
//       return 'https://img.youtube.com/vi/$videoId/0.jpg';
//     }
//     return media?.isNotEmpty == true ? media!.first.previewUrl ?? '' : '';
//   }
// }
  String getPreviewUrl() {
    if (videoLink != null && videoLink!.contains("youtube.com")) {
      final videoId = videoLink!.split("v=").last;
      return 'https://img.youtube.com/vi/$videoId/0.jpg';
    }
    return media?.isNotEmpty == true ? media!.first.previewUrl ?? '' : '';
  }
}

  class Media {
  String? originalUrl;
  String? previewUrl;

  Media({this.originalUrl, this.previewUrl});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      originalUrl: json['originalUrl'],
      previewUrl: json['previewUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originalUrl': originalUrl,
      'previewUrl': previewUrl,
    };
  }
}



