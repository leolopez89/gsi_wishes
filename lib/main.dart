import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsi_wishes/pages/creation_page.dart';
import 'package:gsi_wishes/pages/home_page.dart';
import 'package:gsi_wishes/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Deseos',
      theme: ThemeData(
        primarySwatch: MA_APP_COLOR,
      ),
      // home: CreationPage(),
      home: HomePage(),
    );
  }
}
