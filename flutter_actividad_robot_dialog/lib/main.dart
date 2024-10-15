import 'package:flutter/material.dart';
import 'package:flutter_actividad_robot/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Generador de robots',
        home: Scaffold(
          appBar: AppBar(title: const Text('Generador de robots')),
          body: const HomeScreen(),
        ));
  }
}
