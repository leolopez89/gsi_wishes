import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsi_wishes/bloc/app/app_bloc.dart';
import 'package:gsi_wishes/pages/users_page.dart';
import 'package:gsi_wishes/widgets/widgets.dart';

void main() {
  runApp(WishApp());
}

class WishApp extends StatelessWidget {
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
          primarySwatch: maAppColor,
        ),
        // home: CreationPage(),
        home: UsersPage(),
        // home: HomePage(),
      ),
    );
  }
}
