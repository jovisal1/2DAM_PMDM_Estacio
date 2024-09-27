import 'package:flutter/material.dart';
import 'package:flutter_actividad_app_votacion/presentation/widgets/yes_no_image.dart';

class YesNoScreen extends StatelessWidget {
  final bool yesNo;
  const YesNoScreen({super.key, required this.yesNo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Has votado", textDirection: TextDirection.ltr)),
        body: Center(
          child: YesNoImage(yesNo: yesNo),
        ));
  }
}
