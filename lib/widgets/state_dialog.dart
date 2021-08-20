part of 'widgets.dart';

/// Modal dialog widget to change the state of a [Wish]
class StateDialog extends StatefulWidget {
  final Wish wish;

  const StateDialog({Key? key, required this.wish}) : super(key: key);

  @override
  _StateDialogState createState() => _StateDialogState();
}

class _StateDialogState extends State<StateDialog> {
  String user = appUsers.firstWhere((element) => element.contains("Member"));
  AppWishState state = AppWishState.NUEVA;
  String title = "Asignar Deseo";
  String section = "Seleccionar miembro";

  @override
  void initState() {
    super.initState();
    state = stringToWishState(this.widget.wish.state);
    title = state == AppWishState.NUEVA ? "Asignar Deseo" : "Cambiar estado";
  }

  /// To assing the [Wish] to an user, the state is changed to [AppWishState.ABIERTA]
  _toAssingWish() {
    BlocProvider.of<AppBloc>(context).add(UpdateWishState(Wish(
      id: widget.wish.id,
      title: widget.wish.title,
      description: widget.wish.description,
      type: widget.wish.type,
      project: widget.wish.project,
      date: widget.wish.date,
      assigned: user,
      author: widget.wish.author,
      state: wishStateToString(AppWishState.ABIERTA),
    )));
    Navigator.pop(context);
  }

  /// To change the state of a [Wish] to [AppWishState.EN_PROCESO]
  _toStartWish() {
    BlocProvider.of<AppBloc>(context).add(UpdateWishState(Wish(
      id: widget.wish.id,
      title: widget.wish.title,
      description: widget.wish.description,
      type: widget.wish.type,
      project: widget.wish.project,
      date: widget.wish.date,
      assigned: widget.wish.assigned,
      author: widget.wish.author,
      state: wishStateToString(AppWishState.EN_PROCESO),
    )));
    Navigator.pop(context);
  }

  /// To change the state of a [Wish] to [AppWishState.CERRADA]
  _toEndWish() {
    BlocProvider.of<AppBloc>(context).add(UpdateWishState(Wish(
      id: widget.wish.id,
      title: widget.wish.title,
      description: widget.wish.description,
      type: widget.wish.type,
      project: widget.wish.project,
      date: widget.wish.date,
      assigned: widget.wish.assigned,
      author: widget.wish.author,
      state: wishStateToString(AppWishState.CERRADA),
    )));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
            if (state == AppWishState.NUEVA) ...[
              SectionTitle(title: "Seleccionar miembro"),
              DropdownSimple(
                saveValue: (value) => setState(() => user = value),
                value: user,
                items: appUsers
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
              if (state == AppWishState.ABIERTA)
                Container(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _toStartWish,
                    child: Text("Iniciar"),
                  ),
                ),
              if (state == AppWishState.ABIERTA) SizedBox(height: 10),
              if (state != AppWishState.CERRADA) Container(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: _toEndWish,
                  child: Text("Terminar"),
                ),
              ),
            ],
            if (state == AppWishState.CERRADA) Text("La tarea ya está cerrada.")
          ]),
        )
      ],
    );
  }
}
