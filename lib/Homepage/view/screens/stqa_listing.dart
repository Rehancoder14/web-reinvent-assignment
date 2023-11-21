import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webreinvent/Homepage/controller/home_controller.dart';
import 'package:webreinvent/Homepage/view/component/task_tile.dart';
import 'package:webreinvent/Homepage/view/component/writing_task.dart';

class STQAListing extends StatefulWidget {
  const STQAListing({super.key});

  @override
  State<STQAListing> createState() => _STQAListingState();
}

class _STQAListingState extends State<STQAListing> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        centerTitle: true,
        title: const Text('Software Testing'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.subject = 'ST';
          Get.to(
            WritingAreaScreen(),
          );
        },
        label: const Text('Add Imp'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.stqaList == null || controller.stqaList!.isEmpty
                ? const Center(
                    child: Text('No data found'),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 100),
                    itemCount: controller.stqaList!.length,
                    itemBuilder: (context, index) {
                      return TaskTile(
                        homeModel: controller.stqaList![index],
                      );
                    },
                  ),
      ),
    );
  }
}
