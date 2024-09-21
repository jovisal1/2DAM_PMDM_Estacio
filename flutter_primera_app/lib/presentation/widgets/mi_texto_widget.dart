import 'package:flutter/material.dart';

class MiTexto extends StatelessWidget {
  final String textoAMostrar;

  const MiTexto({required this.textoAMostrar, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(textoAMostrar,
        textDirection: TextDirection.ltr,
        style: const TextStyle(fontWeight: FontWeight.bold));
  }
}
