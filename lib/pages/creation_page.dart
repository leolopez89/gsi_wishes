import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_wishes/getx/creation_controller.dart';
import 'package:gsi_wishes/widgets/widgets.dart';

class CreationPage extends GetView<CreationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo deseo"),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          constraints: BoxConstraints(maxWidth: 500),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                SectionTitle(title: "Título"),
                InputSimple(
                  controller: controller.titleController,
                  validator: controller.emptyValidator,
                ),
                SectionTitle(title: "Descripción"),
                InputSimple(
                  controller: controller.descriptionController,
                  minLines: 4,
                  maxLines: 4,
                  validator: controller.emptyValidator,
                ),
                SectionTitle(title: "Tipo"),
                DropdownSimple(
                  saveValue: controller.setType,
                  value: controller.type,
                  items: appWishType,
                ),
                SectionTitle(title: "Proyecto"),
                DropdownSimple(
                  saveValue: controller.setProject,
                  value: controller.project,
                  items: appProjectName,
                ),
                SectionTitle(title: "Fecha Límite"),
                InputSimple(
                  onTap: () => controller.onDateTap(context),
                  controller: controller.dateController,
                  validator: controller.emptyValidator,
                ),
                SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 500),
                  height: 40,
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.addWish,
                    child: Text("Crear deseo"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
