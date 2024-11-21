import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_database/config/router/routes.dart';
import 'package:flutter_firebase_database/firebase_options.dart';
import 'package:flutter_firebase_database/injection.dart';
import 'package:flutter_firebase_database/presentation/blocs/tasks/tasks_bloc.dart';
import 'package:flutter_firebase_database/presentation/blocs/tasks/tasks_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) {
          TasksBloc tasksBloc = getIt<TasksBloc>();
          // tasksBloc.add(LoadTasksEvent());
          tasksBloc.add(StreamTasksEvent());
          return tasksBloc;
        }),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
