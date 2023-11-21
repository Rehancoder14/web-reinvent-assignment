// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:webreinvent/Homepage/modal/home_modal.dart';
import 'package:webreinvent/services/home_adapter.dart';

class LocalStorageService {
  static late Box<HomeModel> _homeModelBox;

  static Future<void> init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(HomeModelAdapter());
    _homeModelBox = await Hive.openBox<HomeModel>('HomeModels');
  }

  static Future<void> saveHomeModelsToBox(List<HomeModel> homeModels) async {
    await _homeModelBox.clear();
    await _homeModelBox.addAll(homeModels);
  }

  static List<HomeModel> getSavedHomeModels() {
    return _homeModelBox.values.toList();
  }

  Future<void> deleteHomeModel(int itemId) async {
    var itemToDelete =
        _homeModelBox.values.firstWhere((item) => item.id == itemId);

    if (itemToDelete != null) {
      await itemToDelete.delete();
    }
  }

  static bool isDatabaseEmpty() {
    return _homeModelBox.isEmpty;
  }

  Future<void> editHomeModel(int itemId, String? title, bool isChecked) async {
    var itemToEdit =
        _homeModelBox.values.firstWhere((item) => item.id == itemId);
    itemToEdit.title = title;
    itemToEdit.isChecked = isChecked.obs;

    if (itemToEdit != null) {
      await _homeModelBox.put(itemId, itemToEdit);
    }
  }

  Future<void> addHomeModel(
      String title, String subject, bool isChecked) async {
    int millSec = DateTime.now().millisecondsSinceEpoch;
    int uniqueId = millSec % 1000000;

    HomeModel newHomeModel = HomeModel(
      id: uniqueId,
      subject: subject,
      title: title,
      isChecked: isChecked.obs,
    );
    print(subject);
    print(newHomeModel.title.toString());
    print(newHomeModel.id.toString());
    print(newHomeModel.isChecked.toString());
    await LocalStorageService._homeModelBox.put(uniqueId, newHomeModel);
  }
}
