import 'package:flutter/material.dart';

class FormControllerExample extends StatefulWidget {
  const FormControllerExample({super.key});

  @override
  State<FormControllerExample> createState() => _MyFormState();
}

class _MyFormState extends State<FormControllerExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Añadimos un listener al controller para que esté atento a posibles cambios
    _nameController.addListener(_ultimoValorIntroducido);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('El nombre introducido es: ${_nameController.text}');
              },
              child: const Text('Mostrar Nombre'),
            ),
          ],
        ),
      ),
    );
  }

  void _ultimoValorIntroducido() {
    final text = _nameController.text;
    debugPrint(
        'Tamaño del texto introducido: $text (${text.characters.length})');
  }

  @override
  void dispose() {
    // Eliminar el controlador cuando el widget desaparece
    _nameController.dispose();
    super.dispose();
  }
}
