import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_state.dart';

class CounterDrawerWidget extends StatelessWidget {
  const CounterDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListTile(
        title: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text("Cuenta: ${state.counter}");
          },
        ),
      ),
    );
  }
}
