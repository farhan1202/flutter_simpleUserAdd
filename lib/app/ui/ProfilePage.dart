import 'package:flutter/material.dart';
import 'package:flutter_api/app/controllers/profileController.dart';
import 'package:flutter_api/app/controllers/usersController.dart';
import 'package:flutter_api/app/models/user.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final profileC = Get.find<ProfileController>();
  final userC = Get.find<UsersController>();
  final String userId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final User user = userC.userById(userId);
    profileC.nameC.text = user.name!;
    profileC.emailC.text = user.email!;
    profileC.phoneC.text = user.phone!;

    return Scaffold(
      appBar: AppBar(
        title: Text("PROFILE"),
        actions: [
          IconButton(
            onPressed: () => userC.delete(userId).then(
              (deleted) {
                if (deleted) Get.back();
              },
            ),
            icon: Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller: profileC.nameC,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: "Name", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: profileC.emailC,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: "Email", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: profileC.phoneC,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: "Phone", border: OutlineInputBorder()),
                // onEditingComplete: () => userC.add(
                //     addC.nameC.text, addC.emailC.text, addC.phoneC.text),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () => userC.edit(
                        userId,
                        profileC.nameC.text,
                        profileC.emailC.text,
                        profileC.phoneC.text,
                      ),
                  child: Text("Update User"))
            ],
          ),
        ),
      ),
    );
  }
}
