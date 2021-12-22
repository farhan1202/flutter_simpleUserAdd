import 'dart:convert';

import 'package:get/get.dart';

class UserProviders extends GetConnect {
  final url =
      "https://getconnect-projects-default-rtdb.asia-southeast1.firebasedatabase.app/";

  //For GetAll Users
  Future<Response> getDatas() {
    return get(url + "/users.json");
  }

  //For Post data to server firebase
  Future<Response> postData(String name, String email, String phone) {
    final body = json.encode({
      'name': name,
      'email': email,
      'phone': phone,
    });

    return post(url + '/users.json', body);
  }

  //For Delete data from server
  Future<Response> deleteData(String id) {
    return delete(url + "users/$id.json");
  }

  Future<Response> editData(
      String id, String name, String email, String phone) {
    final body = json.encode({
      'name': name,
      'email': email,
      'phone': phone,
    });

    return put(url + '/users/$id.json', body);
  }
}
