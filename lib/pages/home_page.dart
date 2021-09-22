import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_wishes/getx/app_controller.dart';
import 'package:gsi_wishes/widgets/widgets.dart';

class HomePage extends GetView<AppController> {
  const HomePage({Key? key}) : super(key: key);

  void _addTask() {
    Get.toNamed("/creation");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Lista de Deseos"),
            Spacer(),
            Icon(Icons.person),
            SizedBox(width: 5),
            Obx(() => Text(
                  controller.userShortName(),
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
      body: Obx(() => ListView(
            children: List.generate(controller.userWidgets().length,
                (index) => WishItem(controller.userWidgets()[index], controller)),
          )),
      floatingActionButton: controller.showAction()
          ? FloatingActionButton(
              onPressed: _addTask,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
