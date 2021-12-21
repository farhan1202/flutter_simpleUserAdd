import 'package:flutter/material.dart';
import 'package:flutter_api/app/controllers/usersController.dart';
import 'package:flutter_api/app/routes/app_page.dart';
import 'package:flutter_api/app/routes/app_route.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userC = Get.put(UsersController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      getPages: AppPage.pages,
    );
  }
}
