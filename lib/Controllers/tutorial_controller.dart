// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:first_app/Models/tutorial_model.dart';
// import 'package:first_app/Services/repo/tutorial_repo.dart';
//
// class TutorialController extends GetxController {
//   final  tutorials = <Tutorial>[];
//   RxBool loading = false.obs;
//   @override
//   void onInit() {
//     getAllTutorials();
//     super.onInit();
//   }
//
//   getAllTutorials() async {
//     loading.value = true;
//     await TutorialRepo.getTutorial(
//       onSuccess: (tutorial) {
//         loading.value = false;
//         tutorials.addAll(tutorial);
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
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:first_app/Models/tutorial_model.dart';
// import 'package:first_app/Services/repo/tutorial_repo.dart';
//
// class TutorialController extends GetxController {
//   final tutorials = <Tutorial>[].obs;
//   RxBool loading = false.obs;
//
//   @override
//   void onInit() {
//     getAllTutorials();
//     super.onInit();
//   }
//
//   getAllTutorials() async {
//     loading.value = true;
//     await TutorialRepo.getTutorial(
//       onSuccess: (tutorial) {
//         loading.value = false;
//         tutorials.assignAll(tutorial);
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
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:first_app/models/tutorial_model.dart';
// import 'package:first_app/services/Repo/tutorial_repo.dart';
//
// class TutorialController extends GetxController {
//   RxBool loading = false.obs;
//   RxList<Tutorial> tutorials = <Tutorial>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     getAllTutorials();
//   }
//
//   void getAllTutorials() async {
//     loading.value = true;
//     try {
//       List<Tutorial> tutorialList = await TutorialRepo.getTutorials();
//       tutorials.assignAll(tutorialList);
//       loading.value = false;
//     } catch (e) {
//       loading.value = false;
//       log('Error fetching tutorials: $e');
//     }
//   }
//
//   Future<void> launchInBrowser(String url) async {
//     try {
//       final Uri toLaunch = Uri.parse(url);
//       await launch(toLaunch.toString(), forceSafariVC: false);
//     } catch (e) {
//       log("Could not launch: $e");
//     }
//   }
// }

// lib/controllers/tutorial_controller.dart

import 'dart:developer';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:first_app/models/tutorial_model.dart';
import 'package:first_app/Services/Repo/tutorial_repo.dart' as repo;

class TutorialController extends GetxController {
  final tutorials = <Tutorial>[].obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    getAllTutorials();
    super.onInit();
  }

  getAllTutorials() async {
    loading.value = true;
    List<Tutorial> tutorialList = await repo.TutorialRepo.getTutorials();
    loading.value = false;
    tutorials.addAll(tutorialList);
  }

  Future<void> launchInBrowser(String url) async {
    try {
      final Uri toLaunch = Uri.parse(url);
      await launchUrl(toLaunch, mode: LaunchMode.externalApplication);
    } catch (e) {
      log("could not launch -------> $e");
    }
  }
}



