import 'package:flutter/material.dart';
import 'package:flutter_api/app/models/user.dart';
import 'package:flutter_api/app/providers/usersProviders.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  var users = List<User>.empty().obs;

  void snackBarError(String msg) {
    Get.snackbar(
      "Error",
      msg,
      duration: Duration(seconds: 2),
    );
  }

  void add(String name, String email, String phone) {
    if (name != '' && email != '' && phone != '') {
      if (email.contains("@")) {
        UserProviders().postData(name, email, phone).then(
          (value) {
            users.add(
              User(
                id: value.body['name'].toString(),
                name: name,
                email: email,
                phone: phone,
              ),
            );
          },
        );

        Get.back();
      } else {
        snackBarError("Masukan Email Valid");
      }
    } else {
      snackBarError("Semua Data Harus Diisi");
    }
  }

  User userById(String id) {
    return users.firstWhere((element) => element.id == id);
  }

  void edit(String id, String name, String email, String phone) {
    if (name != '' && email != '' && phone != '') {
      if (email.contains("@")) {
        UserProviders().editData(id, name, email, phone).then((value) {
          final user = userById(id);
          user.name = name;
          user.email = email;
          user.phone = phone;
          users.refresh();
        });

        Get.back();
      } else {
        snackBarError("Masukan email valid");
      }
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  Future<bool> delete(String id) async {
    bool _delete = false;
    await Get.defaultDialog(
        title: "Delete",
        middleText: "Apakah kamu yakin untuk menghapus data user ini?",
        textConfirm: "Ya",
        confirmTextColor: Colors.white,
        onConfirm: () {
          UserProviders().deleteData(id);
          users.removeWhere((element) => element.id == id);
          _delete = true;
          Get.back();
        },
        textCancel: "Tidak");
    return _delete;
  }
}
