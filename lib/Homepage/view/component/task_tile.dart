import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webreinvent/Homepage/controller/home_controller.dart';
import 'package:webreinvent/Homepage/modal/home_modal.dart';
import 'package:webreinvent/Homepage/view/component/writing_task.dart';

class TaskTile extends StatelessWidget {
  final HomeModel homeModel;
  TaskTile({super.key, required this.homeModel});
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          Get.to(
            WritingAreaScreen(
              id: homeModel.id,
              description: homeModel.title,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5),
          ),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      '${homeModel.title}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  Checkbox(
                      value: homeModel.isChecked.value,
                      onChanged: (value) {
                        homeModel.isChecked.value = value!;
                        controller.isCompleted(homeModel.id!, homeModel.title!,
                            homeModel.isChecked.value);
                        controller.getHomeModels();
                      }),
                  IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Confirmation',
                        middleText: 'Do you want to perform this action?',
                        textConfirm: 'Yes',
                        textCancel: 'No',
                        confirm: TextButton(
                          onPressed: () {
                            controller.deleteTask(homeModel.id!);
                          },
                          child: const Text('yes'),
                        ),
                        cancel: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('No'),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
