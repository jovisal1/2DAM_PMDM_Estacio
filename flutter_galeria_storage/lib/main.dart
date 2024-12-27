import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_galeria_storage/dependency_injector.dart';
import 'package:flutter_galeria_storage/firebase_options.dart';
import 'package:flutter_galeria_storage/presentation/blocs/image_bloc/image_bloc.dart';
import 'package:flutter_galeria_storage/presentation/blocs/image_bloc/image_event.dart';
import 'package:flutter_galeria_storage/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageBloc>(create: (_) {
          var myImageBloc = sl<ImageBloc>();
          myImageBloc.add(FetchImages());
          return myImageBloc;
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ejemplo de galería',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}
