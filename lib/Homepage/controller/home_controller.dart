import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webreinvent/Homepage/modal/home_modal.dart';
import 'package:webreinvent/Homepage/view/screens/bt_listing.dart';
import 'package:webreinvent/Homepage/view/screens/cs_listing.dart';
import 'package:webreinvent/Homepage/view/screens/daa_listing.dart';
import 'package:webreinvent/Homepage/view/screens/ml_listing.dart';
import 'package:webreinvent/Homepage/view/screens/stqa_listing.dart';
import 'package:webreinvent/services/local_storage_service.dart';

class HomeController extends GetxController {
  TextEditingController textController = TextEditingController();
  List<String> subList = ['DAA', 'ML', 'BT', 'Cyber Security', 'STQA'];
  RxBool isLoading = false.obs;
  String? subject;

  List<HomeModel>? daaList;
  List<HomeModel>? btList;
  List<HomeModel>? mlList;
  List<HomeModel>? csList;
  List<HomeModel>? stqaList;
  @override
  void onInit() async {
    await getHomeModels();

    super.onInit();
  }

  List<HomeModel>? homeModelsList;
  getHomeModels() async {
    isLoading.value = true;

    daaList = LocalStorageService.getSavedHomeModels()
        .where((element) => element.subject == 'DAA')
        .toList();
    btList = LocalStorageService.getSavedHomeModels()
        .where((element) => element.subject == 'BT')
        .toList();
    csList = LocalStorageService.getSavedHomeModels()
        .where((element) => element.subject == 'CS')
        .toList();
    stqaList = LocalStorageService.getSavedHomeModels()
        .where((element) => element.subject == 'ST')
        .toList();
    mlList = LocalStorageService.getSavedHomeModels()
        .where((element) => element.subject == 'ML')
        .toList();
    print(daaList);

    isLoading.value = false;
  }

  addinList() async {
    if (subject == null || textController.text.isEmpty) {
      Get.snackbar('Warning', 'Please fill all the fields');
    } else {
      await LocalStorageService()
          .addHomeModel(textController.text, subject!, false);
      getHomeModels();
      Get.back();
      Get.snackbar('Success', 'Todo task added Successfully');
      textController.clear();
    }
  }

  isCompleted(int id, String title, bool completed) async {
    await LocalStorageService().editHomeModel(id, title, completed);
    if (completed) {
      Get.snackbar('Success', 'Marked as Completed');
    } else {
      Get.snackbar('Success', 'Marked as InCompleted task');
    }
  }

  updateData(int id, String title, bool completed) async {
    await LocalStorageService().editHomeModel(id, title, completed);
    getHomeModels();
    Get.back();
    Get.snackbar('Success', 'Todo task updated successfuly');
  }

  deleteTask(int itemId) async {
    await LocalStorageService().deleteHomeModel(itemId);
    getHomeModels();
    Get.back();
    Get.snackbar('Success', 'Task deleted successfully');
  }

  handleNavigation(int index) {
    switch (index) {
      case 0:
        Get.to(
          const DaaListing(),
        );

        break;
      case 1:
        Get.to(
          const MLListing(),
        );
        break;
      case 2:
        Get.to(
          const BTListing(),
        );
        break;
      case 3:
        Get.to(
          const CSListing(),
        );
        break;
      case 4:
        Get.to(
          const STQAListing(),
        );
        break;
      default:
    }
  }
}
