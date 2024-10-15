import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/screens/counter_home_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter utilizando Bloc',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (context) => CounterBloc(),
          child: const CounterHomePageScreen()),
    );
  }
}
