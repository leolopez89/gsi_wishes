part of 'widgets.dart';

const MaterialColor MA_APP_COLOR = MaterialColor(
  _appPrimaryValue,
  <int, Color>{
    50: Color(0xFFC2EAF4),
    100: Color(0xFF95D6E4),
    200: Color(0xFF6DCEE3),
    300: Color(0xFF4FBDD5),
    400: Color(0xFF2BA0B9),
    500: Color(_appPrimaryValue),
    600: Color(0xFF168CA5),
    700: Color(0xFF077D96),
    800: Color(0xFF0E6C80),
    900: Color(0xFF0A5666),
  },
);
const int _appPrimaryValue = 0xFF2094AD;
const Color C_APP_COLOR = Color(_appPrimaryValue);

const List<String> APP_WISH_TYPE = <String>[
  "Onat",
  "Inventario",
  "Alquiler",
  "Compra producto",
  "Transporte",
];

const List<String> APP_PROJECT_NAME = <String>[
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
const List<String> APP_WISH_STATE = <String>[
  "Nueva",
  "Abierta",
  "En Proceso",
  "Cerrada",
];

const List<String> APP_USERS = <String>[
  "Project Manager",
  "Group Manager",
  "Member 1",
  "Member 2",
];
