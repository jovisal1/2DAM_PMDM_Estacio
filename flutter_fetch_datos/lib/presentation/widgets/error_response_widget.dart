import 'package:flutter/material.dart';

class ErrorResponseWidget extends StatelessWidget {
  final Object? error;

  const ErrorResponseWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Error: $error'),
          ),
        ]);
  }
}
