
import 'package:get/get.dart';
import 'package:gsi_wishes/application/home/index.dart';
import 'package:gsi_wishes/application/users/index.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
    Get.lazyPut(() => HomeController());
  }
}