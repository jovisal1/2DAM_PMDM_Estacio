import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internacionalizacion/presentation/blocs/language/language_event.dart';
import 'package:flutter_internacionalizacion/presentation/blocs/language/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(const Locale('es'))) {
    on<ChangeLanguageEvent>((event, emit) {
      emit(LanguageState(event.locale));
    });
  }
}
