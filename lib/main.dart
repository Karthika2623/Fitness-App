import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app_pages.dart';
import 'app/bindings.dart';
import 'app/routes.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ultra Fit",
      theme: AppTheme.lightTheme,
      initialBinding: AppBinding(),
      initialRoute: Routes.login,
      getPages: AppPages.routes,
    );
  }
}