import 'package:flutter_firebase_cloud_messaging/main.dart';
import 'package:flutter_firebase_cloud_messaging/presentation/screens/detalle_screen.dart';
import 'package:flutter_firebase_cloud_messaging/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
// Definir rutas y asignar navigatorKey
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/detalle',
      builder: (context, state) => DetalleScreen(),
    ),
  ],
);
