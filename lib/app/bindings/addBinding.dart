import 'package:flutter_api/app/controllers/addController.dart';
import 'package:get/get.dart';

class AddBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddController());
    // TODO: implement dependencies
  }
}
