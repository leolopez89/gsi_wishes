import 'package:get/get.dart';
import 'package:gsi_wishes/application/creation/index.dart';
import 'package:gsi_wishes/application/home/index.dart';

class CreationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreationController());
    Get.lazyPut(() => HomeController());
  }
}