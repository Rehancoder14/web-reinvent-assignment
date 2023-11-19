import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeModel extends HiveObject {
  int? id;
  String? title;
  RxBool isChecked = false.obs;

  HomeModel({this.id, this.title, required this.isChecked});
}
