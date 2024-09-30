import 'package:flutter/material.dart';
import 'package:flutter_ejemplo_gestion_tema/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme(selectedColor: 4, isDarkmode: false);

    return MaterialApp(
      theme: appTheme.getTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ejemplo con ThemeData",
            textDirection: TextDirection.ltr,
          ),
        ),
        body: Center(
          child: Text('Hello World!',
              style: Theme.of(context).textTheme.displayLarge),
        ),
      ),
    );
  }
}
