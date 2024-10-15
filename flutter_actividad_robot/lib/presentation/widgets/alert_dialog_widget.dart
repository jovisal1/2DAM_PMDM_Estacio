import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final bool resultado;
  final String textoAMostrar;
  const AlertDialogWidget(
      {super.key, required this.resultado, required this.textoAMostrar});

  @override
  Widget build(BuildContext context) {
    String textoCentral =
        resultado ? "Generación satisfactoria" : "Generación errónea";
    String assetAMostrar =
        resultado ? "assets/images/ok.png" : "assets/images/ko.png";

    return AlertDialog(
      title: const Text("Generación de robot finalizada"),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(textoCentral),
          Image.asset(
            assetAMostrar,
            width: 200,
          ),
          Text(
            textoAMostrar,
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, false); // Cerrar el diálogo
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true); // Cerrar el diálogo
            // Acción si se selecciona 'Aceptar'
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
