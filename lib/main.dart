import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gsi_wishes/getx/creation_controller.dart';
import 'package:gsi_wishes/pages/creation_page.dart';
import 'package:gsi_wishes/pages/home_page.dart';
import 'package:gsi_wishes/pages/users_page.dart';
import 'package:gsi_wishes/widgets/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Deseos',
      theme: ThemeData(
        primarySwatch: maAppColor,
      ),
      initialRoute: '/users',
      getPages: [
        GetPage(
          name: '/users',
          page: () => UsersPage(),
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
      ],
    );
  }
}
