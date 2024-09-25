import 'package:flutter_ejemplo_listview/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        }),
    GoRoute(
        path: '/simple_list',
        builder: (BuildContext context, GoRouterState state) {
          return const SimpleListViewScreen();
        }),
    GoRoute(
        path: '/complex_list',
        builder: (BuildContext context, GoRouterState state) {
          return ComplexListViewScreen();
        })
  ],
);
