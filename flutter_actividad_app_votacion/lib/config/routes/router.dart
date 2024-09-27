import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_actividad_app_votacion/presentation/screens/screens.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        }),
    GoRoute(
        path: '/yes_no/:yesnoValue',
        builder: (BuildContext context, GoRouterState state) {
          String yesnoValue = state.pathParameters["yesnoValue"] ?? "yes";
          bool yesNo = yesnoValue == "yes" ? true : false;
          return YesNoScreen(yesNo: yesNo);
        }),
  ],
);
