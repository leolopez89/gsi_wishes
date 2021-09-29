import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_wishes/application/users/index.dart';

class UsersPage extends GetView<UsersController> {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Seleccionar el usuario"),
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(50),
            children: List.generate(
              _.users.length,
              (index) => Container(
                width: 60,
                height: 40,
                margin: EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: () => _.selectUser(_.users[index]),
                  child: Text(_.users[index]),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
