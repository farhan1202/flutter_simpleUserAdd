import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController emailC;
  late TextEditingController phoneC;

  @override
  void onInit() {
    nameC = TextEditingController();
    emailC = TextEditingController();
    phoneC = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    emailC.dispose();
    phoneC.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
