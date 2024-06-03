// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:first_app/Models/notice_model.dart';
// import 'package:first_app/Services/repo/notice_repo.dart';
//
// class NoticeController extends GetxController {
//   RxList<Notice> notices = RxList();
//   RxInt unReadCount = RxInt(0);
//   RxBool loading = false.obs;
//   @override
//   void onInit() {
//     getAllNotices();
//     super.onInit();
//   }
//
//   getAllNotices() async {
//     loading.value = true;
//     await NoticeRepo.getNotice(
//       onSuccess: (notice) {
//         loading.value = false;
//         notices.addAll(notice);
//         unReadCount.value += notice.length;
//       },
//       onError: ((message) {
//         loading.value = false;
//         log("error ");
//       }),
//     );
//   }
//
//   Future<void> launchInBrowser(String url) async {
//     try {
//       final Uri toLaunch = Uri.parse(url);
//       await launchUrl(toLaunch, mode: LaunchMode.externalApplication);
//     } catch (e) {
//       log("couldnot launch ------->");
//     }
//   }
// }

// import 'dart:developer';
//
// import 'package:first_app/Services/Repo/notice_repo.dart';
// import 'package:first_app/models/notice_model.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class NoticeController extends GetxController {
//   RxList<Notice> notices = RxList();
//   RxInt unReadCount = RxInt(0);
//   RxBool loading = false.obs;
//
//   @override
//   void onInit() {
//     getAllNotices();
//     super.onInit();
//   }
//
//   getAllNotices() async {
//     loading.value = true;
//     await NoticeRepo.getNotice(
//       onSuccess: (notice) {
//         loading.value = false;
//         notices.assignAll([...notice]); // Convert List<Notice> to Iterable<Notice>
//         unReadCount.value += notice.length;
//       },
//       onError: ((message) {
//         loading.value = false;
//         log("error ");
//       }),
//     );
//   }
//
//   Future<void> launchInBrowser(String url) async {
//     try {
//       final Uri toLaunch = Uri.parse(url);
//       await launchUrl(toLaunch, mode: LaunchMode.externalApplication);
//     } catch (e) {
//       log("could not launch: $e");
//     }
//   }
// }


import 'dart:developer';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:first_app/models/notice_model.dart';
import 'package:first_app/services/Repo/notice_repo.dart';

class NoticeController extends GetxController {
  RxList<Notice> notices = RxList<Notice>();
  RxInt unReadCount = RxInt(0);
  RxBool loading = false.obs;

  @override
  void onInit() {
    getAllNotices();
    super.onInit();
  }

  getAllNotices() async {
    loading.value = true;
    await NoticeRepo.getNotice(
      onSuccess: (notice) {
        loading.value = false;
        notices.assignAll(notice); // Assign the list directly
        unReadCount.value += notice.length;
      },
      onError: (message) {
        loading.value = false;
        log("Error: $message");
      },
    );
  }

  Future<void> launchInBrowser(String url) async {
    try {
      // Ensure URL starts with http:// or https://
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        url = 'http://$url';
      }
      final Uri toLaunch = Uri.parse(url);
      if (await canLaunchUrl(toLaunch)) {
        await launchUrl(toLaunch, mode: LaunchMode.externalApplication);
      } else {
        log("Could not launch URL: $url");
      }
    } catch (e) {
      log("Could not launch: $e");
    }
  }
}




