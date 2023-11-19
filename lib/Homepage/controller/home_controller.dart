import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webreinvent/Homepage/modal/home_modal.dart';
import 'package:webreinvent/services/local_storage_service.dart';

class HomeController extends GetxController {
  TextEditingController textController = TextEditingController();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    getHomeModels();
    super.onInit();
  }

  List<HomeModel>? homeModelsList;
  getHomeModels() {
    isLoading.value = true;

    homeModelsList = LocalStorageService.getSavedHomeModels();
    isLoading.value = false;
  }

  addinList() async {
    await LocalStorageService().addHomeModel(textController.text, false);
    getHomeModels();
    Get.back();
    Get.snackbar('Success', 'Todo task added Successfully');
    textController.clear();
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
}
