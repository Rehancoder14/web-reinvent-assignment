import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webreinvent/Homepage/controller/home_controller.dart';
import 'package:webreinvent/Homepage/view/component/task_tile.dart';
import 'package:webreinvent/Homepage/view/component/writing_task.dart';

class DaaListing extends StatefulWidget {
  const DaaListing({super.key});

  @override
  State<DaaListing> createState() => _DaaListingState();
}

class _DaaListingState extends State<DaaListing> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.getHomeModels();
      },
      child: Scaffold(
        backgroundColor: Colors.purple.shade100,
        appBar: AppBar(
          backgroundColor: Colors.purple.shade100,
          centerTitle: true,
          title: const Text('Design Analytics'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            controller.subject = 'DAA';
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
              : controller.daaList == null || controller.daaList!.isEmpty
                  ? const Center(
                      child: Text('No data found'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 100),
                      itemCount: controller.daaList!.length,
                      itemBuilder: (context, index) {
                        return TaskTile(
                          homeModel: controller.daaList![index],
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
