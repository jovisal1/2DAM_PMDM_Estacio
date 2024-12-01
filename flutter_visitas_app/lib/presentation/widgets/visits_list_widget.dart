import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visitas_app/domain/entities/visit_entity.dart';
import 'package:flutter_visitas_app/presentation/blocs/visits/visits_bloc.dart';
import 'package:flutter_visitas_app/presentation/blocs/visits/visits_state.dart';

class VisitsList extends StatelessWidget {
  const VisitsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return BlocBuilder<VisitsBloc, VisitsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator();
        } else if (state.errorMessage != null &&
            state.errorMessage!.isNotEmpty) {
          return Center(
            child: Text(state.errorMessage ?? "ERROR"),
          );
        }

        return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: state.visits.length,
            itemBuilder: (BuildContext context, int index) {
              VisitEntity visitaSel = state.visits.elementAt(index);
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(visitaSel.nombre),
                                Text(visitaSel.email)
                              ],
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Text("Día"),
                            Text("Hora ini"),
                            Text("Hora fin")
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [Text("Logo tipo visita"), Text("Button")],
                  )
                ],
              );
            });
      },
    );
  }
}
