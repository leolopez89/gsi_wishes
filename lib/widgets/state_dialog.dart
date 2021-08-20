part of 'widgets.dart';

class StateDialog extends StatefulWidget {
  final Wish wish;

  const StateDialog({Key? key, required this.wish}) : super(key: key);

  @override
  _StateDialogState createState() => _StateDialogState();
}

class _StateDialogState extends State<StateDialog> {
  String user = APP_USERS.firstWhere((element) => element.contains("Member"));
  AppWishState state = AppWishState.NUEVA;
  String title = "Asignar Deseo";
  String section = "Seleccionar miembro";

  @override
  void initState() {
    super.initState();
    AppWishState.values.forEach((element) {
      print(element.toString().replaceAll("AppWishState.", ""));
    });
    print(this.widget.wish.state);
    state = AppWishState.values.firstWhere((element) =>
        element.toString().replaceAll("AppWishState.", "") ==
        this.widget.wish.state);
    title = state == AppWishState.NUEVA ? "Asignar Deseo" : "Cambiar estado";
  }

  _toAssingWish() {}

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      title: new Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: MA_APP_COLOR.shade900,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          child: Column(children: [
            if (state == AppWishState.NUEVA) ...[
              SectionTitle(title: "Seleccionar miembro"),
              DropdownSimple(
                saveValue: (value) => setState(() => user = value),
                value: user,
                items: APP_USERS
                    .where((element) => element.contains("Member"))
                    .toList(),
              ),
              SizedBox(height: 30),
              Container(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: _toAssingWish,
                  child: Text("Asignar deseo"),
                ),
              ),
            ],
            if (state != AppWishState.NUEVA) ...[
              if (state == AppWishState.ABIERTA) Container(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: _toAssingWish,
                  child: Text("Iniciar"),
                ),
              ),
              if (state == AppWishState.ABIERTA) SizedBox(height: 10),
              Container(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: _toAssingWish,
                  child: Text("Terminar"),
                ),
              ),
            ]
          ]),
        )
      ],
    );
  }
}
