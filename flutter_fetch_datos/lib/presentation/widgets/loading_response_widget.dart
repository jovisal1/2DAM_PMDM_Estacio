import 'package:flutter/material.dart';

class LoadingResponseWidget extends StatelessWidget {
  const LoadingResponseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text('Esperando resultado...'),
          ),
        ]);
  }
}
