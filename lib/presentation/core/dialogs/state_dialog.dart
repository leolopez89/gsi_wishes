
import 'package:flutter/material.dart';
import 'package:gsi_wishes/application/home/index.dart';
import 'package:gsi_wishes/core/index.dart';
import 'package:gsi_wishes/presentation/core/resources/index.dart';
import 'package:gsi_wishes/presentation/core/widgets/index.dart';
import 'package:gsi_wishes/domain/wish/entities/index.dart';

class StateDialog extends StatelessWidget {
  final Wish wish;
  final HomeController ctrl;

  const StateDialog(this.wish, this.ctrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppWishState wishState = ctrl.wishState(wish.state);
    final String title = ctrl.title(wish.state);

    return new SimpleDialog(
      title: new Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: maAppColor.shade900,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          child: Column(children: [
            if (wishState == AppWishState.NUEVA) ...[
              SectionTitle(title: "Seleccionar miembro"),
              DropdownSimple(
                saveValue: ctrl.setUser,
                value: ctrl.selectedUser,
                items: ctrl.users,
              ),
              SizedBox(height: 30),
              Container(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: () => ctrl.toAssingWish(wish),
                  child: Text("Asignar deseo"),
                ),
              ),
            ],
            if (wishState != AppWishState.NUEVA) ...[
              if (wishState == AppWishState.ABIERTA)
                Container(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => ctrl.toStartWish(wish),
                    child: Text("Iniciar"),
                  ),
                ),
              if (wishState == AppWishState.ABIERTA) SizedBox(height: 10),
              if (wishState != AppWishState.CERRADA)
                Container(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => ctrl.toEndWish(wish),
                    child: Text("Terminar"),
                  ),
                ),
            ],
            if (wishState == AppWishState.CERRADA)
              Text("La tarea ya está cerrada.")
          ]),
        )
      ],
    );
  }
}
