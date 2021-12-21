import 'package:flutter_api/app/controllers/profileController.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    // TODO: implement dependencies
  }
}
