import 'package:get/get.dart';
import 'package:gsi_wishes/core/navigation/routes.dart';
import 'package:gsi_wishes/domain/creation/bindings/index.dart';
import 'package:gsi_wishes/domain/users/bindings/index.dart';
import 'package:gsi_wishes/presentation/creation/index.dart';
import 'package:gsi_wishes/presentation/home/index.dart';
import 'package:gsi_wishes/presentation/users/index.dart';

class WishesNav {
  static List<GetPage> routes = [
        GetPage(
          name: Routes.USERS,
          page: () => UsersPage(),
          binding: UsersBinding()
        ),
        GetPage(
          name: Routes.HOME,
          page: () => HomePage(),
        ),
        GetPage(
          name: Routes.CREATION,
          page: () => CreationPage(),
          binding: CreationBinding(),
        ),
      ];
}
