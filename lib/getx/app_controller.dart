import 'package:get/get.dart';
import 'package:gsi_wishes/models/wish.dart';
import 'package:gsi_wishes/widgets/widgets.dart';

class AppController extends GetxController {
  var wishes = <Wish>[].obs;
  var user = "".obs;
  String selectedUser = "";
  List<String> get users =>
      appUsers.where((element) => element.contains("Member")).toList();

  @override
  void onInit() {
    super.onInit();
    wishes.value = loadTestData();
    prepareUser();
  }

  void prepareUser() => selectedUser = users.first;

  void updateWish(Wish wish) {
    int index = wishes.indexWhere((w) => w.id == wish.id);
    wishes[index] = wish;
  }

  void addWish(Wish wish) {
    wishes.add(wish);
  }

  void updateUser(String user) {
    this.user.value = user;
  }

  List<Wish> userWidgets() => user.contains("Member")
      ? wishes.where((wish) => wish.assigned == user.toString()).toList()
      : wishes;

  String userShortName() =>
      user.contains("Project") ? "PM" : (user.contains("Group") ? "GM" : "M");

  bool showAction() => user.contains("Project");

  void setUser(appUser) => selectedUser = appUser;

  AppWishState wishState(String state) => stringToWishState(state);

  String title(String state) {
    return stringToWishState(state) == AppWishState.NUEVA
        ? "Asignar Deseo"
        : "Cambiar estado";
  }

  toAssingWish(Wish wish) {
    wish.state = wishStateToString(AppWishState.ABIERTA);
    wish.assigned = selectedUser;
    final appController = Get.find<AppController>();
    appController.updateWish(wish);
    Get.back();
  }

  toStartWish(Wish wish) {
    wish.state = wishStateToString(AppWishState.EN_PROCESO);
    final appController = Get.find<AppController>();
    appController.updateWish(wish);
    Get.back();
  }

  toEndWish(Wish wish) {
    wish.state = wishStateToString(AppWishState.CERRADA);
    final appController = Get.find<AppController>();
    appController.updateWish(wish);
    Get.back();
  }

}
