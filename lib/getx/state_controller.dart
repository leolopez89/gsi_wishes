import 'package:get/get.dart';
import 'package:gsi_wishes/getx/app_controller.dart';
import 'package:gsi_wishes/models/wish.dart';
import 'package:gsi_wishes/widgets/widgets.dart';

class StateController extends GetxController {
  var wish = Wish();
  String user = "";

  List<String> get users =>
      appUsers.where((element) => element.contains("Member")).toList();

  @override
  void onInit() {
    user = users.first;
    super.onInit();
  }

  String title() {
    return stringToWishState(wish.state) == AppWishState.NUEVA
        ? "Asignar Deseo"
        : "Cambiar estado";
  }

  AppWishState wishState() => stringToWishState(wish.state);

  void setUser(appUser) => user = appUser;

  toAssingWish() {
    wish.state = wishStateToString(AppWishState.ABIERTA);
    wish.assigned = user;
    final appController = Get.find<AppController>();
    appController.updateWish(wish);
    Get.back();
  }

  toStartWish() {
    wish.state = wishStateToString(AppWishState.EN_PROCESO);
    final appController = Get.find<AppController>();
    appController.updateWish(wish);
    Get.back();
  }

  toEndWish() {
    wish.state = wishStateToString(AppWishState.CERRADA);
    final appController = Get.find<AppController>();
    appController.updateWish(wish);
    Get.back();
  }
}

class CreationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StateController());
    Get.lazyPut(() => AppController());
  }
}
