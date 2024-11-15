import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_twitter_copy/config/router/routes.dart';
import 'package:flutter_twitter_copy/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_twitter_copy/presentation/blocs/tweet/tweet_bloc.dart';
import 'injection.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AuthBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<TweetBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        title: 'Clon de Twitter',
      ),
    );
  }
}
