// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:first_app/Services/repo/exam_paper_repo.dart';
// import 'package:first_app/Models/exam_paper_model.dart';
//
// class ExamPaperController extends GetxController {
//   RxList<ExamPaper> examPapers = RxList();
//   RxBool loading = false.obs;
//   @override
//   void onInit() {
//     getAllExamPapers();
//     super.onInit();
//   }
//
//   getAllExamPapers() async {
//     loading.value = true;
//     await ExamPaperRepo.getExamPaper(
//       onSuccess: (examPaper) {
//         loading.value = false;
//         examPapers.addAll(examPaper);
//       },
//       onError: ((message) {
//         loading.value = false;
//         log("error ");
//       }),
//     );
//   }
// }

// import 'package:get/get.dart';
// import 'package:first_app/Models/exam_paper_model.dart';
//
// import '../Services/Repo/exam_paper_repo.dart';
//
// class ExamPaperController extends GetxController {
//   var loading = true.obs;
//   var examPapers = <ExamPaper>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchExamPapers();
//   }
//
//   void fetchExamPapers() async {
//     try {
//       loading.value = true;
//       await ExamPaperRepo.getExamPaper(
//         onSuccess: (papers) {
//           examPapers.assignAll(papers);
//           loading.value = false;
//         },
//         onError: (message) {
//           Get.snackbar("Error", message);
//           loading.value = false;
//         },
//       );
//     } catch (e) {
//       Get.snackbar("Error", "Failed to fetch data");
//       loading.value = false;
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:first_app/Models/exam_paper_model.dart';

import '../Services/Repo/exam_paper_repo.dart';

class ExamPaperController extends GetxController {
  var examPapers = <ExamPaper>[].obs;
  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchExamPapers();
  }

  void fetchExamPapers() {
    loading.value = true;
    ExamPaperRepo.getExamPaper(
      onSuccess: (papers) {
        examPapers.value = papers;
        loading.value = false;
      },
      onError: (message) {
        loading.value = false;
        Get.snackbar('Error', message);
      },
    );
  }
}

