import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webreinvent/Homepage/controller/home_controller.dart';
import 'package:webreinvent/Homepage/view/home_page.dart';
import 'package:webreinvent/services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  // Hive.registerAdapter(HomeModelAdapter());
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(
        () {
          Get.put(
            HomeController(),
          );
        },
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
