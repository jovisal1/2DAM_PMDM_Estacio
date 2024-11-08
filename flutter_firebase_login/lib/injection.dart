import 'package:flutter_firebase_login/data/datasources/firebase_auth_datasource.dart';
import 'package:flutter_firebase_login/data/repositories/sign_in_repository_impl.dart';
import 'package:flutter_firebase_login/domain/repositories/sign_in_repository.dart';
import 'package:flutter_firebase_login/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_firebase_login/domain/usecases/sign_in_user_usecase.dart';
import 'package:flutter_firebase_login/domain/usecases/sign_out_user_usecase.dart';
import 'package:flutter_firebase_login/presentation/blocs/auth/login_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void configureDependencies() {
  // BLocs
  sl.registerFactory<LoginBloc>(
    () => LoginBloc(sl(), sl(), sl()),
  );

  // Instancia de Firebase Auth
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Fuentes de datos
  sl.registerLazySingleton<FirebaseAuthDataSource>(
    () => FirebaseAuthDataSource(auth: sl<FirebaseAuth>()),
  );

  // Repositorios
  sl.registerLazySingleton<SignInRepository>(
    () => SignInRepositoryImpl(sl<FirebaseAuthDataSource>()),
  );

  // Casos de uso
  sl.registerLazySingleton<SigninUserUseCase>(
    () => SigninUserUseCase(sl()),
  );
  sl.registerLazySingleton<SignoutUserUseCase>(
    () => SignoutUserUseCase(sl()),
  );
  sl.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(sl()),
  );
}
