import 'package:get/get.dart';
import 'package:gsi_wishes/getx/creation_controller.dart';
import 'package:gsi_wishes/getx/users_controller.dart';
import 'package:gsi_wishes/pages/creation_page.dart';
import 'package:gsi_wishes/pages/home_page.dart';
import 'package:gsi_wishes/pages/users_page.dart';

class WishesNav {
  static List<GetPage> routes = [
        GetPage(
          name: '/users',
          page: () => UsersPage(),
          binding: UsersBinding()
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/creation',
          page: () => CreationPage(),
          binding: CreationBinding(),
        ),
      ];
}
