import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  //La clave contiene el FormState
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  String? _selectedValue;

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
              CheckboxListTile(
                value: isChecked,
                title: const Text('Animate Slowly'),
                activeColor: Colors.green,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  String mensajeRespuesta = "Todo correcto!";
                  if (_formKey.currentState!.validate() == false) {
                    mensajeRespuesta = "Algún campo no es válido";
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(mensajeRespuesta)),
                  );
                },
                child: const Text('Enviar'),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                  value: _selectedValue,
                  hint: const Text('Seleccione una opción'),
                  decoration: const InputDecoration(
                    labelText: 'Opción',
                    // border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                        value: 'opcion1', child: Icon(Icons.abc_rounded)),
                    DropdownMenuItem(value: 'opcion2', child: Text('Opción 2')),
                    DropdownMenuItem(value: 'opcion3', child: Text('Opción 3')),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor seleccione una opción';
                    }
                    return null;
                  }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Si el formulario es válido, guardar los datos
                    _formKey.currentState!.save();
                  }
                },
                child: const Text('Guardar'),
              ),
            ]),
      ),
    );
  }
}
