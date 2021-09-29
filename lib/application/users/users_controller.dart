import 'package:get/get.dart';
import 'package:gsi_wishes/application/home/index.dart';
import 'package:gsi_wishes/core/index.dart';
import 'package:gsi_wishes/core/navigation/index.dart';

class UsersController extends GetxController {
  var users = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    users.value = appUsers;
  }

  selectUser(String user) {
    final appController = Get.find<HomeController>();
    appController.updateUser(user);
    Get.toNamed(Routes.HOME);
  }
}
