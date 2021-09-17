import 'package:get/get.dart';
import 'package:gsi_wishes/models/wish.dart';

class AppController extends GetxController {
  var wishes = <Wish>[].obs;
  var user = "".obs;

  @override
  void onInit() {
    super.onInit();
    wishes.value = loadTestData();
  }

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
}
