import 'package:flutter/material.dart';

class CounterButtonsWidget extends StatelessWidget {
  const CounterButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      FloatingActionButton(onPressed: () {}, child: const Text("+")),
      const SizedBox(
        height: 15,
      ),
      FloatingActionButton(onPressed: () {}, child: const Text("-"))
    ]);
  }
}
