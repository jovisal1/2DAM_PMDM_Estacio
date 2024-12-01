import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visitas_app/firebase_options.dart';
import 'package:flutter_visitas_app/injection.dart';
import 'package:flutter_visitas_app/presentation/blocs/visits/visits_bloc.dart';
import 'package:flutter_visitas_app/presentation/blocs/visits/visits_event.dart';
import 'package:flutter_visitas_app/presentation/blocs/visits/visits_state.dart';
import 'package:flutter_visitas_app/presentation/widgets/visits_list_widget.dart';

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
    return BlocProvider(
      create: (_) {
        VisitsBloc visit = getIt<VisitsBloc>();
        visit.add(LoadVisitsEvent());
        return visit;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Column(
                  children: [Text('Registro de visitas'), Text('IES Estació')],
                ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 124, 133, 204),
                    child: Text('AH'),
                  ),
                )
              ],
            ),
            body: const VisitsList()),
      ),
    );
  }
}
