import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_wishes/getx/app_controller.dart';
import 'package:gsi_wishes/widgets/widgets.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.put(AppController());

    _selectUser(String user) {
      appController.updateUser(user);
      Get.toNamed("/home");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Seleccionar el usuario"),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(50),
          children: List.generate(
            appUsers.length,
            (index) => Container(
              width: 60,
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () => _selectUser(appUsers[index]),
                child: Text(appUsers[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
