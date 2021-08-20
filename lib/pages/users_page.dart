import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsi_wishes/bloc/app/app_bloc.dart';
import 'package:gsi_wishes/pages/home_page.dart';
import 'package:gsi_wishes/widgets/widgets.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  selectUser(String user) {
    BlocProvider.of<AppBloc>(context).add(ChangeUser(user));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seleccionar el usuario"),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(50),
          children: List.generate(
            APP_USERS.length,
            (index) => Container(
              width: 60,
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () => selectUser(APP_USERS[index]),
                child: Text(APP_USERS[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
