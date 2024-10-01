import 'package:flutter/material.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    super.key,
    required this.productoSel,
  });

  final Map<String, dynamic> productoSel;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(productoSel['title'],
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      Text("${productoSel['price']}€", style: const TextStyle(fontSize: 10))
    ]);
  }
}
