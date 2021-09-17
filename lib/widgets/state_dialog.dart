part of 'widgets.dart';

class StateDialog extends StatelessWidget {
  final Wish wish;

  const StateDialog(this.wish, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StateController controller = Get.put(StateController());
    controller.wish = wish;

    final AppWishState wishState = controller.wishState();
    final String title = controller.title();

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
                saveValue: controller.setUser,
                value: controller.user,
                items: controller.users,
              ),
              SizedBox(height: 30),
              Container(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: controller.toAssingWish,
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
                    onPressed: controller.toStartWish,
                    child: Text("Iniciar"),
                  ),
                ),
              if (wishState == AppWishState.ABIERTA) SizedBox(height: 10),
              if (wishState != AppWishState.CERRADA)
                Container(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: controller.toEndWish,
                    child: Text("Terminar"),
                  ),
                ),
            ],
            if (wishState == AppWishState.CERRADA) Text("La tarea ya está cerrada.")
          ]),
        )
      ],
    );
  }
}
