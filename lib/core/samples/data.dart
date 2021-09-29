import 'package:gsi_wishes/domain/wish/index.dart';

List<Wish> loadTestData() {
  final List<Wish> wishes = [
    Wish(
      id: "6c84fb90-12c4-11e1-840d-7b25c5ee775a",
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
      id: "110ec58a-a0f2-4ac4-8393-c866d813b8d1",
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
      id: "c74a196f-f19d-5ea9-bffd-a2742432fc9c",
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
      id: "710b962e-041c-11e1-9234-0123456789ab",
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
      id: "a2b962e-11e1-11e1-041c-0124211789ab",
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
  return wishes;
}
