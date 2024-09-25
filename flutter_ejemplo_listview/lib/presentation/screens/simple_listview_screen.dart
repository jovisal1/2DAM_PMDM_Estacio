import 'package:flutter/material.dart';

class SimpleListViewScreen extends StatelessWidget {
  const SimpleListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple ListView'),
      ),
      body: Center(
          child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: Row(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset("assets/images/guerrero-espartano.png",
                      height: 200, fit: BoxFit.fill)),
              const Text("Elemento 1"),
            ] // Texto del nombre
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: Row(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset("assets/images/guerrero-espartano.png",
                      height: 200, fit: BoxFit.fill)),
              const Text("Elemento 2"),
            ] // Texto del nombre
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: Row(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset("assets/images/guerrero-espartano.png",
                      height: 200, fit: BoxFit.fill)),
              const Text("Elemento 3"),
            ] // Texto del nombre
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: Row(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset("assets/images/guerrero-espartano.png",
                      height: 200, fit: BoxFit.fill)),
              const Text("Elemento 4"),
            ] // Texto del nombre
                ),
          )
        ],
      )),
    );
  }
}
