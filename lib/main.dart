import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gsi_wishes/core/navigation/index.dart';
import 'package:gsi_wishes/presentation/core/resources/index.dart';

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
      getPages: WishesNav.routes,
    );
  }
}
