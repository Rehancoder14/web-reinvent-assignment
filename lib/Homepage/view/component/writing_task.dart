// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webreinvent/Homepage/controller/home_controller.dart';

class WritingAreaScreen extends StatefulWidget {
  String? description;
  int? id;
  WritingAreaScreen({Key? key, this.description, this.id}) : super(key: key);

  @override
  State<WritingAreaScreen> createState() => _WritingAreaScreenState();
}

class _WritingAreaScreenState extends State<WritingAreaScreen> {
  final controller = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    if (widget.description != null) {
      controller.textController.text = widget.description!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.textController.clear();
        Get.back();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add task'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            autofocus: true,
            controller: Get.find<HomeController>().textController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              hintText: 'Write something here',
              border: InputBorder.none,
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () async {
              if (widget.description != null) {
                controller.updateData(
                    widget.id!,
                    controller.textController.text,
                    controller.homeModelsList!
                        .firstWhere((element) => element.id == widget.id)
                        .isChecked
                        .value);
              } else {
                controller.addinList();
              }
            },
            child: const Text(
              'Submit',
            ),
          ),
        ),
      ),
    );
  }
}
