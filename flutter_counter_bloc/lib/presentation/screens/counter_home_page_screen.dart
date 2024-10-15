import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_event.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_state.dart';
import 'package:flutter_counter_bloc/presentation/widgets/counter_buttons_widget.dart';
import 'package:flutter_counter_bloc/presentation/widgets/counter_drawer_widget.dart';

class CounterHomePageScreen extends StatelessWidget {
  const CounterHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                  'Total transacciones: ${state.transactionCount}'); //Como Text está envuelto por BlocBuilder, podemos acceder al state de forma sencilla
            },
          ),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterReset());
                },
                child: const Icon(Icons.refresh))
          ],
        ),
        body: Center(
          child:
              BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text('Cuenta:  ${state.counter}');
          }),
        ),
        floatingActionButton: const CounterButtonsWidget(),
        drawer: const CounterDrawerWidget());
  }
}
