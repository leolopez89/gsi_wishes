import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_wishes/application/home/index.dart';
import 'package:gsi_wishes/core/navigation/index.dart';
import 'package:gsi_wishes/presentation/home/widgets/index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  void _addTask() {
    Get.toNamed(Routes.CREATION);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("Lista de Deseos"),
              Spacer(),
              Icon(Icons.person),
              SizedBox(width: 5),
              Text(
                _.userShortName(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        body: ListView(
          children: List.generate(_.userWidgets().length,
              (index) => WishItem(_.userWidgets()[index], _)),
        ),
        floatingActionButton: _.showAction()
            ? FloatingActionButton(
                onPressed: _addTask,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              )
            : null,
      );
    });
  }
}
