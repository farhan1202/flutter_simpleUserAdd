import 'package:flutter_api/app/bindings/addBinding.dart';
import 'package:flutter_api/app/bindings/profileBinding.dart';
import 'package:flutter_api/app/routes/app_route.dart';
import 'package:flutter_api/app/ui/AddPage.dart';
import 'package:flutter_api/app/ui/HomePage.dart';
import 'package:flutter_api/app/ui/ProfilePage.dart';
import 'package:get/get.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
    GetPage(name: Routes.addPage, page: () => AddPage(), binding: AddBinding()),
    GetPage(
        name: Routes.profilePage,
        page: () => ProfilePage(),
        binding: ProfileBinding()),
  ];
}
