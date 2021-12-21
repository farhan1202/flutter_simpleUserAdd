import 'package:flutter/material.dart';
import 'package:flutter_api/app/controllers/addController.dart';
import 'package:flutter_api/app/controllers/usersController.dart';
import 'package:get/get.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addC = Get.find<AddController>();
    final userC = Get.find<UsersController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD USER"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller: addC.nameC,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: "Name", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: addC.emailC,
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
                controller: addC.phoneC,
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
                  onPressed: () => userC.add(
                        addC.nameC.text,
                        addC.emailC.text,
                        addC.phoneC.text,
                      ),
                  child: Text("Add User"))
            ],
          ),
        ),
      ),
    );
  }
}
