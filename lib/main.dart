import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_flutter/routes/app_routes.dart';
import 'package:test_flutter/utils/theme.dart';


void main() async {
  // Initialize GetStorage
  await GetStorage.init();

  // Run the app
  runApp(
    GetMaterialApp(

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.counter,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    ),
  );
}