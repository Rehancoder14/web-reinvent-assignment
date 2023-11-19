import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webreinvent/Homepage/controller/home_controller.dart';
import 'package:webreinvent/Homepage/view/component/task_tile.dart';
import 'package:webreinvent/Homepage/view/component/writing_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.getHomeModels();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Todo List'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(WritingAreaScreen());
          },
          label: const Text('Add  task'),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.homeModelsList == null ||
                      controller.homeModelsList!.isEmpty
                  ? const Center(
                      child: Text('No data found'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 100),
                      itemCount: controller.homeModelsList!.length,
                      itemBuilder: (context, index) {
                        return TaskTile(
                          homeModel: controller.homeModelsList![index],
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
