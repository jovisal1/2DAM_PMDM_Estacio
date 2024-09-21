import 'package:flutter/material.dart';
import 'package:flutter_primera_app/presentation/widgets/mi_texto_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aplicación Material',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Título de la barra'),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MiTexto(textoAMostrar: 'El valor de la cuenta es:'),
              Text('$contador'),
            ],
          )),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    contador++;
                  });
                  debugPrint("[LOG] -> El valor de contador es: $contador");
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    contador--;
                  });
                  debugPrint("[LOG] -> El valor de contador es: $contador");
                },
                child: const Icon(Icons.remove),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    contador = 0;
                  });
                  debugPrint("[LOG] -> El valor de contador es: $contador");
                },
                child: const Icon(Icons.refresh),
              ),
            ],
          ),
        ));
  }
}
