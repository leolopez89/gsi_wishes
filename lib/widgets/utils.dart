part of 'widgets.dart';

const MaterialColor maAppColor = MaterialColor(
  appPrimaryValue,
  <int, Color>{
    50: Color(0xFFC2EAF4),
    100: Color(0xFF95D6E4),
    200: Color(0xFF6DCEE3),
    300: Color(0xFF4FBDD5),
    400: Color(0xFF2BA0B9),
    500: Color(appPrimaryValue),
    600: Color(0xFF168CA5),
    700: Color(0xFF077D96),
    800: Color(0xFF0E6C80),
    900: Color(0xFF0A5666),
  },
);
const int appPrimaryValue = 0xFF2094AD;
const Color cAppColor = Color(appPrimaryValue);

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
