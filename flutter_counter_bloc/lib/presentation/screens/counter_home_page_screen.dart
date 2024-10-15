import 'package:flutter/material.dart';
import 'package:flutter_counter_bloc/presentation/widgets/counter_buttons_widget.dart';

class CounterHomePageScreen extends StatelessWidget {
  const CounterHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Total transacciones: 0"),
        actions: [
          TextButton(onPressed: () {}, child: const Icon(Icons.refresh))
        ],
      ),
      body: const Center(
        child: Text("Cuenta: 0"),
      ),
      floatingActionButton: const CounterButtonsWidget(),
    );
  }
}
