import 'package:flutter/material.dart';
import 'package:flutter_listado_productos_detalle/data/products.dart';
import 'package:flutter_listado_productos_detalle/presentation/widgets/product_info_widget.dart';
import 'package:flutter_listado_productos_detalle/presentation/widgets/reviews_list_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  final String idProducto;
  const ProductDetailScreen({super.key, required this.idProducto});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> productoSel = products
        .firstWhere((product) => product['id'] == int.parse(idProducto));
    return Scaffold(
        appBar: AppBar(
          title: Text('Producto $idProducto'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ProductInfoWidget(productoSel: productoSel),
              ),
              const SizedBox(),
              const Text("Reviews"),
              Expanded(
                child: ReviewsListWidget(productoSel: productoSel),
              )
            ],
          ),
        ));
  }
}
