import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsi_wishes/bloc/app/app_bloc.dart';
import 'package:gsi_wishes/models/wish.dart';
import 'package:gsi_wishes/pages/creation_page.dart';
import 'package:gsi_wishes/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addTask() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (_, state) {
      List<Wish> current = [];
      if (state.user.contains("Member")) {
        current = state.wishes
            .where((element) => element.assigned == state.user)
            .toList();
      } else
        current = state.wishes;
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("Lista de Deseos"),
              Spacer(),
              Icon(Icons.person),
              SizedBox(width: 5),
              Text(
                state.user.contains("Project") ? "PM" : (state.user.contains("Group") ? "GM" : "M"),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        body: ListView(
          children: List.generate(
              current.length, (index) => WishItem(current[index])),
        ),
        floatingActionButton: state.user.contains("Project")
            ? FloatingActionButton(
                onPressed: _addTask,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              )
            : null,
      );
    });
  }
}
