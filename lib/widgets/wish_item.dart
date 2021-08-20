part of 'widgets.dart';

class WishItem extends StatelessWidget {
  final Wish wish;
  const WishItem(this.wish, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: EdgeInsets.all(20),
      // height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: maAppColor.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.wish.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            // maxLines: 1,
            // overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            this.wish.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                this.wish.type,
                style: TextStyle(
                  fontSize: 18,
                  color: maAppColor.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                this.wish.project,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 10),
                    Text(
                      this.wish.date,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Text(
                  this.wish.assigned,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Divider(
            height: 20,
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Autor: ${this.wish.author}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => StateDialog(
                        wish: this.wish,
                      ),
                    ),
                    child: Text(
                      this.wish.state.toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/**
 * Titulo:
 * Descripción:
 * Tipo: (Onat, Inventario, Alquiler, Compra producto, Transporte)
 * Proyecto: (Proyecto 1, Proyecto 2, Proyecto 3, Proyecto 4)
 * Fecha cumplimiento: (Para cuando se necesita que esté ejecutada la tarea).
 * Responsable:
 * Author:
 * Estado: (Nueva, Abierta, En Proceso, Cerrada) (esto debe ser con botones
 *         donde el que tiene la tarea asignada le de iniciar, terminar y cambie, en el caso
 *         de la tarea recién creada se pone como nueva, cuando el manager de
 *         Infraestructura la acepta y asigna pasa a Abierta)
 */