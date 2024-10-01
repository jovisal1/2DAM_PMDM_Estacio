import 'package:flutter/material.dart';
import 'package:flutter_listado_productos_detalle/config/router/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, // Configuración de `go_router`
    );
  }
}
