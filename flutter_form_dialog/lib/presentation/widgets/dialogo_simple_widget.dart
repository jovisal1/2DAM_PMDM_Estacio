import 'package:flutter/material.dart';

class DialogoSimple extends StatelessWidget {
  const DialogoSimple({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Selecciona una opción'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Opción 1');
          },
          child: const Text('Opción 1'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Opción 2');
          },
          child: const Text('Opción 2'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Opción 3');
          },
          child: const Text('Opción 3'),
        ),
      ],
    );
  }
}
