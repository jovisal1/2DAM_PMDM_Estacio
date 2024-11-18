import 'package:flutter_twitter_copy/data/datasources/tweet_remote_datasource.dart';
import 'package:flutter_twitter_copy/data/datasources/user_remote_datasource.dart';
import 'package:flutter_twitter_copy/data/repositories/tweet_repository_impl.dart';
import 'package:flutter_twitter_copy/data/repositories/user_repository_impl.dart';
import 'package:flutter_twitter_copy/domain/repositories/tweet_repository.dart';
import 'package:flutter_twitter_copy/domain/repositories/user_repository.dart';
import 'package:flutter_twitter_copy/domain/usecases/create_tweet_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/delete_tweet_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/follow_user_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/get_followuserstweets_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/get_tweets_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/get_user_info_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/like_tweet_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/login_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/search_users_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/update_tweet_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/update_user_info_usecase.dart';
import 'package:flutter_twitter_copy/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_twitter_copy/presentation/blocs/tweet/tweet_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void setupDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // DataSource
  sl.registerLazySingleton(() => UserRemoteDatasource());
  sl.registerLazySingleton(() => TweetRemoteDataSource());

  // Repositories
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<TweetRepository>(
    () => TweetRepositoryImpl(remoteDataSource: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetUserInfoUseCase(sl()));
  sl.registerLazySingleton(() => UpdateUserInfoUseCase(sl()));
  sl.registerLazySingleton(() => GetTweetsUseCase(sl()));
  sl.registerLazySingleton(() => CreateTweetUseCase(sl()));
  sl.registerLazySingleton(() => DeleteTweetUseCase(sl()));
  sl.registerLazySingleton(() => LikeTweetUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTweetUseCase(sl()));
  sl.registerLazySingleton(() => GetFollowUsersTweetsUseCase(sl()));
  sl.registerLazySingleton(() => SearchUsersUsecase(sl()));
  sl.registerLazySingleton(() => FollowUserUsecase(sl()));

  // Blocs
  sl.registerFactory(() => AuthBloc(
        loginUseCase: sl(),
        getUserInfoUseCase: sl(),
        updateUserInfoUseCase: sl(),
      ));

  sl.registerFactory(() => TweetBloc(
      getTweetsUseCase: sl(),
      createTweetUseCase: sl(),
      deleteTweetUseCase: sl(),
      likeTweetUseCase: sl(),
      updateTweetUseCase: sl(),
      getFollowUsersTweetUseCase: sl(),
      followUserUseCase: sl(),
      searchUsersUsecase: sl()));
}
