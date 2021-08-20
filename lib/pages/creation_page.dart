import 'package:flutter/material.dart';
import 'package:gsi_wishes/models/wish.dart';
import 'package:gsi_wishes/utils/utils.dart';
import 'package:gsi_wishes/widgets/widgets.dart';

class CreationPage extends StatefulWidget {
  const CreationPage({Key? key}) : super(key: key);

  @override
  _CreationPageState createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  var dateController = TextEditingController();
  late Wish wish;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    wish = new Wish(
      type: APP_WISH_TYPE.first,
      project: APP_PROJECT_NAME.first,
      state: AppState.NUEVA.toString(),
      author: APP_USERS.firstWhere((element) => element.contains("Project")),
    );
  }

  _addWish() {
    final form = formKey.currentState;
    print(wish.toString());

    if (form != null && form.validate()) {
      print("VALID");
    }
  }

  onDateTap() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    DateTime initial = DateTime.parse(dateController.text.isNotEmpty
        ? dateController.text
        : DateTime.now().toLocal().toString().split(' ')[0]);
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: new DateTime.now(),
      lastDate: new DateTime.now().add(Duration(days: 30)),
    );
    if (selectedDate != null) {
      setState(() {
        dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
        wish.date = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  String? emptyValidator(String? value) {
    if ((value ?? "").toString().isEmpty) return "Debe proporcionar un valor";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo deseo"),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          constraints: BoxConstraints(maxWidth: 500),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SectionTitle(title: "Título"),
                InputSimple(
                  saveValue: (value) => setState(() => this.wish.title = value),
                  validator: emptyValidator,
                ),
                SectionTitle(title: "Descripción"),
                InputSimple(
                  saveValue: (value) =>
                      setState(() => this.wish.description = value),
                  minLines: 4,
                  maxLines: 4,
                  validator: emptyValidator,
                ),
                SectionTitle(title: "Tipo"),
                DropdownSimple(
                  saveValue: (value) => setState(() => this.wish.type = value),
                  value: this.wish.type,
                  items: APP_WISH_TYPE,
                ),
                SectionTitle(title: "Proyecto"),
                DropdownSimple(
                  saveValue: (value) =>
                      setState(() => this.wish.project = value),
                  value: this.wish.project,
                  items: APP_PROJECT_NAME,
                ),
                SectionTitle(title: "Fecha Límite"),
                InputSimple(
                  saveValue: (value) => setState(() => this.wish.date = value),
                  onTap: onDateTap,
                  controller: dateController,
                  validator: emptyValidator,
                ),
                SectionTitle(title: "Estado"),
                DropdownSimple(
                  saveValue: (value) => setState(() => this.wish.state = value),
                  value: this.wish.state,
                  items: AppState.values.map((e) => e.toString()).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          height: 40,
          margin: EdgeInsets.all(20),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _addWish,
            child: Text("Crear deseo"),
          ),
        ),
      ),
    );
  }
}

// Titulo
// Descripción
// Tipo
// Proyecto
// Fecha
// Responsable
// Author
// Estado