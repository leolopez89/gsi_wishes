import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_wishes/getx/home_controller.dart';
import 'package:gsi_wishes/models/wish.dart';
import 'package:gsi_wishes/widgets/widgets.dart';
import 'package:uuid/uuid.dart';

class CreationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var dateController = TextEditingController();
  late Wish wish;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void onInit() {
    wish = new Wish(
      type: appWishType.first,
      project: appProjectName.first,
      state: wishStateToList().first,
      author: appUsers.firstWhere((element) => element.contains("Project")),
    );

    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  String? emptyValidator(String? value) {
    return value?.isEmpty ?? true ? "Debe proporcionar un valor" : null;
  }

  get type => wish.type;
  void setType(dynamic type) => wish.type = type;

  get project => wish.project;
  void setProject(dynamic project) => wish.project = project;

  onDateTap(context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    DateTime initial = DateTime.parse(dateController.text.isNotEmpty
        ? dateController.text
        : DateTime.now().toLocal().toString().split(' ')[0]);
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: new DateTime.now(),
      lastDate: new DateTime.now().add(Duration(days: 30)),
    );
    if (selectedDate != null) {
      dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      wish.date = "${selectedDate.toLocal()}".split(' ')[0];
    }
  }

  addWish() {
    if (formKey.currentState?.validate() ?? false) {
      wish.title = titleController.text;
      wish.description = descriptionController.text;
      var uuid = Uuid();
      wish.id = uuid.v1();
      final appController = Get.find<HomeController>();
      appController.addWish(wish);
      Get.back();
    }
  }
}

class CreationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreationController());
    Get.lazyPut(() => HomeController());
  }
}
