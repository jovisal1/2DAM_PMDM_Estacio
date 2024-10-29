import 'package:equatable/equatable.dart';

abstract class CharacterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCharactersEvent extends CharacterEvent {
  final String filter;

  LoadCharactersEvent(this.filter);

  @override
  List<Object?> get props => [filter];
}
