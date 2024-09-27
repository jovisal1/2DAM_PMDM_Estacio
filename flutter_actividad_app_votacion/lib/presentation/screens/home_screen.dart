import 'package:flutter/material.dart';
import 'package:flutter_actividad_app_votacion/presentation/widgets/yes_no_selector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Ejemplo go_router")),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              YesNoSelector(yesNo: true),
              SizedBox(height: 10),
              YesNoSelector(yesNo: false)
            ],
          ),
        ));
  }
}
