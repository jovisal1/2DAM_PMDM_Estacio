import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push('/detalle'); // Navegación con go_router
          },
          child: Text('Ir a Detalle'),
        ),
      ),
    );
  }
}
