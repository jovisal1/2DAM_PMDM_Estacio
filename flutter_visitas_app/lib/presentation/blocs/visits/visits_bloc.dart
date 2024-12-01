import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visitas_app/core/usecase.dart';
import 'package:flutter_visitas_app/domain/usecases/get_visits_usecase.dart';
import 'package:flutter_visitas_app/presentation/blocs/visits/visits_event.dart';
import 'package:flutter_visitas_app/presentation/blocs/visits/visits_state.dart';

class VisitsBloc extends Bloc<VisitsEvent, VisitsState> {
  final GetVisits getVisits;
  VisitsBloc({
    required this.getVisits,
  }) : super(const VisitsState()) {
    on<LoadVisitsEvent>(_onLoadVisits);
  }

  Future<void> _onLoadVisits(
      LoadVisitsEvent event, Emitter<VisitsState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getVisits(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
          isLoading: false, errorMessage: "Error cargando visitas")),
      (visits) => emit(state.copyWith(isLoading: false, visits: visits)),
    );
  }
}
