import 'package:flutter_listado_productos_detalle/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/', // Ruta raíz o Home
      builder: (context, state) => const ProductsListScreen(),
    ),
    GoRoute(
        path: '/product_detail/:idProduct', // Ruta con parámetro dinámico
        builder: (context, state) {
          final String idProducto =
              state.pathParameters['idProduct'] ?? "NO_PRODUCT";
          return ProductDetailScreen(idProducto: idProducto);
        }),
  ],
);
