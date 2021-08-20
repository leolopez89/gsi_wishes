import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsi_wishes/bloc/app/app_bloc.dart';
import 'package:gsi_wishes/pages/creation_page.dart';
import 'package:gsi_wishes/pages/home_page.dart';
import 'package:gsi_wishes/pages/users_page.dart';
import 'package:gsi_wishes/widgets/widgets.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lista de Deseos',
        theme: ThemeData(
          primarySwatch: MA_APP_COLOR,
        ),
        // home: CreationPage(),
        home: UsersPage(),
        // home: HomePage(),
      ),
    );
  }
}
