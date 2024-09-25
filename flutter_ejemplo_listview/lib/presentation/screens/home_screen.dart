import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  context.push("/simple_list");
                },
                child: const Text(
                  "ListView sencillo",
                  textDirection: TextDirection.ltr,
                )),
            TextButton(
                onPressed: () {
                  context.push("/complex_list");
                },
                child: const Text(
                  "ListView complejo",
                  textDirection: TextDirection.ltr,
                ))
          ],
        ),
      ),
    );
  }
}
