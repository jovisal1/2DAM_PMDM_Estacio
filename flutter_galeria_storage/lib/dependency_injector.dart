import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_galeria_storage/data/datasources/firebase_storage_datasource.dart';
import 'package:flutter_galeria_storage/data/repositories/image_repository_impl.dart';
import 'package:flutter_galeria_storage/domain/repositories/image_repository.dart';
import 'package:flutter_galeria_storage/domain/usecases/delete_image_usecase.dart';
import 'package:flutter_galeria_storage/domain/usecases/fetch_image_usecase.dart';
import 'package:flutter_galeria_storage/domain/usecases/upload_image_usecase.dart';
import 'package:flutter_galeria_storage/presentation/blocs/image_bloc/image_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Firebase Storage
  sl.registerLazySingleton(() => FirebaseStorage.instance);

  // DataSource
  sl.registerLazySingleton<FirebaseStorageDataSource>(
    () => FirebaseStorageDataSourceImpl(storage: sl()),
  );

  // Repositories
  sl.registerLazySingleton<ImageRepository>(
    () => ImageRepositoryImpl(dataSource: sl()),
  );

  // Casos de uso
  sl.registerLazySingleton(() => FetchImagesUseCase(sl()));
  sl.registerLazySingleton(() => UploadImageUseCase(sl()));
  sl.registerLazySingleton(() => DeleteImageUseCase(sl()));

  // BLoC
  sl.registerFactory(() => ImageBloc(
        fetchImagesUseCase: sl(),
        uploadImageUseCase: sl(),
        deleteImageUseCase: sl(),
      ));
}
