import 'package:flutter/material.dart';

class DialogAlerta extends StatelessWidget {
  const DialogAlerta({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmación'),
      content: const Text('¿Estás seguro de continuar?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Cancelar'); // Retornar 'Cancelar'
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Aceptar'); // Retornar 'Aceptar'
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
