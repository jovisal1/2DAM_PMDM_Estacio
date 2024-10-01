import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  //La clave contiene el FormState
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      //Asociamos la clave al formulario
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Introduce tu nombre',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre es obligatorio';
                    }
                    return null;
                  }),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  String mensajeRespuesta = "Todo correcto!";
                  if (!_formKey.currentState!.validate()) {
                    mensajeRespuesta = "Algún campo no es válido";
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(mensajeRespuesta)),
                  );
                },
                child: const Text('Enviar'),
              ),
            ]),
      ),
    );
  }
}
