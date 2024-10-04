import 'package:flutter/material.dart';
import 'package:flutter_form_dialog/infraestructure/models/registered_user.dart';
import 'package:flutter_form_dialog/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Mostrar el AlertDialog y obtener el valor de retorno
                final resultado = await _mostrarAlerta(context);
                debugPrint(resultado);
              },
              child: const Text('Mostrar Alerta'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _mostrarSimpleDialog(context);
              },
              child: const Text('Abrir SimpleDialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                RegisteredUser? usuario =
                    await _mostrarDialogoConFormulario(context);

                if (context.mounted && usuario != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(usuario.toString())));
                }
              },
              child: const Text('Abrir Dialog Formulario'),
            ),
          ],
        ),
      ),
    );
  }

  Future<RegisteredUser?> _mostrarDialogoConFormulario(BuildContext context) {
    return showDialog<RegisteredUser>(
        context: context,
        builder: (context) {
          return const DialogoPersonalizado();
        });
  }

  Future<String?> _mostrarAlerta(BuildContext context) async {
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return const DialogAlerta();
      },
    );
  }

  Future<void> _mostrarSimpleDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const DialogoSimple();
      },
    );
  }
}
