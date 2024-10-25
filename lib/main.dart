import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox('token');
  runApp(
    GetMaterialApp.router(
      // translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      title: 'IITF',
      getPages: AppPages.routes,
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
    ),
  );
}
