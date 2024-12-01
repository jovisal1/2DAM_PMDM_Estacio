import 'package:equatable/equatable.dart';
import 'package:flutter_visitas_app/domain/entities/visit_entity.dart';

class VisitsState extends Equatable {
  final List<VisitEntity> visits;
  final bool isLoading;
  final String? errorMessage;

  const VisitsState({
    this.visits = const <VisitEntity>[],
    this.isLoading = false,
    this.errorMessage,
  });

  VisitsState copyWith({
    List<VisitEntity>? visits,
    bool? isLoading,
    String? errorMessage,
  }) {
    return VisitsState(
      visits: visits ?? this.visits,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [visits, isLoading, errorMessage];
}
