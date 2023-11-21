import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webreinvent/Homepage/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.purple.shade100,
        centerTitle: true,
        title: const Text('Subjects'),
      ),
      body: ListView.builder(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 100, top: 80),
        itemCount: controller.subList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.handleNavigation(index);
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            controller.subList[index],
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
