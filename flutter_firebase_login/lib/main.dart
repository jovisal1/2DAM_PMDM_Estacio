import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/config/router/routes.dart';
import 'package:flutter_firebase_login/firebase_options.dart';
import 'package:flutter_firebase_login/injection.dart';
import 'package:flutter_firebase_login/presentation/blocs/auth/login_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Ejemplo de Login con Firebase',
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
