import 'package:flutter/material.dart';
import 'package:flutter_listado_productos_detalle/data/products.dart';
import 'package:flutter_listado_productos_detalle/presentation/widgets/product_info_widget.dart';
import 'package:go_router/go_router.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de productos'),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: products.length, // Número total de ítems en la lista
        itemBuilder: (BuildContext context, int index) {
          // Esta función se ejecuta para cada ítem visible de la lista
          return GestureDetector(
            onTap: () {
              int idSelectedProduct = products[index]['id'];
              context.push('/product_detail/$idSelectedProduct');
            },
            child: Card(
              elevation: 8,
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: <Widget>[
                  Image.network(products[index]['thumbnail'],
                      width: 150,
                      fit: BoxFit.fill), // Imagen cargada desde la web
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductInfoWidget(productoSel: products[index])),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
