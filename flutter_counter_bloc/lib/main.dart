import 'package:flutter/material.dart';
import 'package:flutter_counter_bloc/presentation/screens/counter_home_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Counter utilizando Bloc',
      debugShowCheckedModeBanner: false,
      home: CounterHomePageScreen(),
    );
  }
}
