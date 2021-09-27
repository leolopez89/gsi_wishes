import 'package:get/get.dart';
import 'package:gsi_wishes/getx/home_controller.dart';
import 'package:gsi_wishes/widgets/widgets.dart';

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
    Get.toNamed("/home");
  }
}


class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
    Get.lazyPut(() => HomeController());
  }
}