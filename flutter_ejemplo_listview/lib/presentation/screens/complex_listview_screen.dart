import 'package:flutter/material.dart';

class ComplexListViewScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"name": "Elemento 1", "image": "assets/images/guerrero-espartano.png"},
    {"name": "Elemento 2", "image": "assets/images/guerrero-espartano.png"},
    {"name": "Elemento 3", "image": "assets/images/guerrero-espartano.png"},
    {"name": "Elemento 4", "image": "assets/images/guerrero-espartano.png"},
    {"name": "Elemento 5", "image": "assets/images/guerrero-espartano.png"},
  ];
  ComplexListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex ListView'),
      ),
      body: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Row(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(items[index]["image"]!,
                            height: 200, fit: BoxFit.fill)),
                    Text(items[index]["name"]!),
                  ] // Texto del nombre
                      ),
                );
              })),
    );
  }
}
