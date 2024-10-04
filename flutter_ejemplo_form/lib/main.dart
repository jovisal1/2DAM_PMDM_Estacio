import 'package:flutter/material.dart';
import 'package:flutter_ejemplo_form/presentation/widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Ejemplo de formulario')),
        body: const <Widget>[
          FormExample(),
          FormControllerExample()
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.list),
              label: 'Form',
            ),
            NavigationDestination(
              icon: Icon(Icons.list),
              label: 'Form con controller',
            )
          ],
        ),
      ),
    );
  }
}
