import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeModel extends HiveObject {
  int? id;
  String? title;
  RxBool isChecked = false.obs;
  String? subject;
  HomeModel({this.id, this.title, this.subject, required this.isChecked});
}
