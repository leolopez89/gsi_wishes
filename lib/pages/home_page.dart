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
  final List<Wish> wishes = [
    Wish(
      title: "Cambiar servidor",
      description: "Remplazar el disco duro secundario",
      type: "Onat",
      project: "Proyecto 1",
      date: "2021-08-25",
      assigned: "Member 1",
      author: "Project Manager",
      state: "ABIERTA",
    ),
    Wish(
      title: "Pintar las paredes",
      description: "El comedor y la cocina",
      type: "Alquiler",
      project: "Proyecto 3",
      date: "2021-08-24",
      assigned: "Member 2",
      author: "Project Manager",
      state: "EN_PROCESO",
    ),
    Wish(
      title: "Cambiar comustible",
      description: "Cambiar reserva del camión",
      type: "Transporte",
      project: "Proyecto 2",
      date: "2021-08-25",
      assigned: "",
      author: "Project Manager",
      state: "NUEVA",
    ),
    Wish(
      title: "Organizar cajas",
      description: "Cambiar las cajas del almacén de lugar",
      type: "Inventario",
      project: "Proyecto 4",
      date: "2021-08-26",
      assigned: "",
      author: "Project Manager",
      state: "NUEVA",
    ),
    Wish(
      title: "Comprar luminarias",
      description: "Adquirir las luminarias en oferta de la compañia",
      type: "Compra producto",
      project: "Proyecto 3",
      date: "2021-08-26",
      assigned: "",
      author: "Project Manager",
      state: "NUEVA",
    ),
  ];
  void _addTask() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (_, state) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("Lista de Deseos"),
              Spacer(),
              Icon(Icons.person),
              SizedBox(width: 5),
              Text(state.user),
            ],
          ),
        ),
        body: ListView(
          children:
              List.generate(wishes.length, (index) => WishItem(wishes[index])),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addTask,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
