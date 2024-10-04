import 'package:flutter/material.dart';
import 'package:flutter_form_dialog/infraestructure/models/registered_user.dart';

class DialogoPersonalizado extends StatefulWidget {
  const DialogoPersonalizado({super.key});

  @override
  State<DialogoPersonalizado> createState() => _DialogoPersonalizadoState();
}

class _DialogoPersonalizadoState extends State<DialogoPersonalizado> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Datos de Usuario',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: correoController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu correo electrónico';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      // Validar y procesar datos
                      if (_formKey.currentState?.validate() ?? false) {
                        // Cerrar el diálogo y mostrar mensaje de confirmación
                        RegisteredUser usuario = RegisteredUser(
                            nombre: nombreController.text,
                            correo: correoController.text);
                        Navigator.pop(context, usuario); // Cerrar el diálogo
                        debugPrint(
                            "${nombreController.text} ${correoController.text}");
                      }
                    },
                    child: const Text('Enviar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Cerrar el diálogo
                    },
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
