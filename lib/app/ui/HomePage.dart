import 'package:flutter/material.dart';
import 'package:flutter_api/app/controllers/usersController.dart';
import 'package:flutter_api/app/providers/usersProviders.dart';
import 'package:flutter_api/app/routes/app_route.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final userC = Get.find<UsersController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ALL USERS"),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.addPage),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
          child: Obx(() => Padding(
              padding: EdgeInsets.all(20),
              child: (userC.users.isEmpty)
                  ? Center(
                      child: Text("Belum Ada Data"),
                    )
                  : ListView.builder(
                      itemCount: userC.users.length,
                      itemBuilder: (context, i) => ListTile(
                        leading: CircleAvatar(),
                        title: Text("${userC.users[i].name}"),
                        subtitle: Text("${userC.users[i].email}"),
                        trailing: IconButton(
                            onPressed: () => userC.delete(userC.users[i].id),
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red[900],
                            )),
                        onTap: () => Get.toNamed(Routes.profilePage,
                            arguments: userC.users[i].id),
                      ),
                    )))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          UserProviders().getDatas().then((value) => print(value.body));
        },
        child: Icon(Icons.get_app_rounded),
      ),
    );
  }
}
