import 'package:flutter/material.dart';
import 'package:flutter_ejemplo_gestion_tema/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int valorSeleccionado = 0;
  bool darkmode = false;

  @override
  Widget build(BuildContext context) {
    final appTheme =
        AppTheme(selectedColor: valorSeleccionado, isDarkmode: darkmode);

    return MaterialApp(
      theme: appTheme.getTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ejemplo con ThemeData",
            textDirection: TextDirection.ltr,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Gestionando el tema de la app"),
            Slider(
              value: valorSeleccionado.toDouble(),
              max: 8,
              divisions: 8,
              label: valorSeleccionado.round().toString(),
              onChanged: (double value) {
                setState(() {
                  valorSeleccionado = value.round();
                });
              },
            ),
            SwitchListTile(
              title: const Text('Modo oscuro'),
              value: darkmode,
              onChanged: (bool? value) {
                debugPrint(value.toString());
                setState(() {
                  darkmode = value ?? false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
