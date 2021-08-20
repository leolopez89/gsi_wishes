part of 'widgets.dart';

/// Main app [MaterialColor]
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

/// App base [int] color
const int appPrimaryValue = 0xFF2094AD;

/// App base [Color]
const Color cAppColor = Color(appPrimaryValue);

/// The list of [Wish] types
const List<String> appWishType = <String>[
  "Onat",
  "Inventario",
  "Alquiler",
  "Compra producto",
  "Transporte",
];

/// The list of [Wish] project types
const List<String> appProjectName = <String>[
  "Proyecto 1",
  "Proyecto 2",
  "Proyecto 3",
  "Proyecto 4",
];

/// The states of a [Wish]
enum AppWishState {
  NUEVA,
  ABIERTA,
  EN_PROCESO,
  CERRADA,
}

/// [String] value of AppWishState
String wishStateToString(AppWishState value) {
  return value.toString().replaceAll("AppWishState.", "");
}

/// [List] of values of AppWishState converted to [String]
List<String> wishStateToList() {
  return AppWishState.values
      .map((element) => wishStateToString(element))
      .toList();
}

/// AppWishState equivalent value of a [String]
AppWishState stringToWishState(String cad) {
  return AppWishState.values.firstWhere(
      (element) => element.toString().replaceAll("AppWishState.", "") == cad,
      orElse: () => AppWishState.NUEVA);
}

/// [List] of user in the app
const List<String> appUsers = <String>[
  "Project Manager",
  "Group Manager",
  "Member 1",
  "Member 2",
];
