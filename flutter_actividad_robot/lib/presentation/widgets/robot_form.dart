import 'package:flutter/material.dart';
import 'package:flutter_actividad_robot/presentation/widgets/alert_dialog_widget.dart';

class FormRobot extends StatefulWidget {
  const FormRobot({super.key});

  @override
  State<FormRobot> createState() => _FormRobotState();
}

class _FormRobotState extends State<FormRobot> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreRobotController = TextEditingController();
  String nombreRobot = "Pepe";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(label: Text("Nombre:")),
                controller: _nombreRobotController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Debe introducir un nombre para generar el robot";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () async {
                      bool generacionOk = false;
                      String textoSnack = "";
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          nombreRobot = _nombreRobotController.text;
                        });
                        textoSnack =
                            "Robot actualizado con el nombre $nombreRobot";
                        generacionOk = true;
                      } else {
                        textoSnack =
                            "Debe introducir un nombre para generar el robot";
                        generacionOk = false;
                      }

                      bool resultado =
                          await _mostrarAlerta(generacionOk, textoSnack);
                      debugPrint(resultado.toString());

                      // ScaffoldMessenger.of(context)
                      //     .showSnackBar(SnackBar(content: Text(textoSnack)));
                    },
                    child: const Text("Generar robot")),
              ),
              Center(child: getRobotImage(nombreRobot)),
            ]),
      ),
    );
  }

  Image getRobotImage(String? nombre) {
    if (nombre == null || nombre.isEmpty) {
      return Image.network(
          "https://upload.wikimedia.org/wikipedia/en/0/02/Homer_Simpson_2006.png");
    }
    return Image.network("https://robohash.org/$nombreRobot");
  }

  Future<bool> _mostrarAlerta(bool resultado, String textoAMostrar) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogWidget(
              resultado: resultado, textoAMostrar: textoAMostrar);
        });
  }
}
