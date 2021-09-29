
const List<String> appWishType = <String>[
  "Onat",
  "Inventario",
  "Alquiler",
  "Compra producto",
  "Transporte",
];

const List<String> appProjectName = <String>[
  "Proyecto 1",
  "Proyecto 2",
  "Proyecto 3",
  "Proyecto 4",
];

enum AppWishState {
  NUEVA,
  ABIERTA,
  EN_PROCESO,
  CERRADA,
}

String wishStateToString(AppWishState value) {
  return value.toString().replaceAll("AppWishState.", "");
}

List<String> wishStateToList() {
  return AppWishState.values
      .map((element) => wishStateToString(element))
      .toList();
}

AppWishState stringToWishState(String cad) {
  return AppWishState.values.firstWhere(
      (element) => element.toString().replaceAll("AppWishState.", "") == cad,
      orElse: () => AppWishState.NUEVA);
}

const List<String> appUsers = <String>[
  "Project Manager",
  "Group Manager",
  "Member 1",
  "Member 2",
];
