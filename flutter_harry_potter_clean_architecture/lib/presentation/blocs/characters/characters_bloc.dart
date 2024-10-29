import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_harry_potter_clean_architecture/domain/usecases/get_all_characters_usecase.dart';
import 'package:flutter_harry_potter_clean_architecture/presentation/blocs/characters/characters_event.dart';
import 'package:flutter_harry_potter_clean_architecture/presentation/blocs/characters/characters_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetAllCharacters getAllCharacters;

  CharacterBloc(this.getAllCharacters) : super(CharacterState.initial()) {
    on<LoadCharactersEvent>(_onLoadCharacters);
  }

  // Método para manejar el evento de cargar personajes
  Future<void> _onLoadCharacters(
    LoadCharactersEvent event,
    Emitter<CharacterState> emit,
  ) async {
    // Actualizar el estado para indicar que estamos cargando
    emit(state.copyWith(isLoading: true, filter: event.filter));

    // Obtener los personajes del caso de uso
    final result = await getAllCharacters();

    result.fold(
      // En caso de error, actualizar el estado con el mensaje de error
      (error) => emit(
          state.copyWith(isLoading: false, errorMessage: error.toString())),
      // En caso de éxito, actualizar el estado con los personajes filtrados
      (characters) {
        final filteredCharacters = characters.where((character) {
          return character.name
              .toLowerCase()
              .contains(event.filter.toLowerCase());
        }).toList();
        emit(state.copyWith(isLoading: false, characters: filteredCharacters));
      },
    );
  }
}
