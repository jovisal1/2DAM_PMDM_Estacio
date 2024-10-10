import 'package:flutter_widgets_navegacion/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/', // Ruta raíz o Home
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'bottomNavigationBar',
      path: '/bottomNavigationBar',
      builder: (context, state) => const BottomNavigationBarExampleScreen(),
    ),
    GoRoute(
      name: 'drawer',
      path: '/drawer',
      builder: (context, state) => const DrawerExampleScreen(),
    ),
    GoRoute(
      name: 'TabView',
      path: '/TabView',
      builder: (context, state) => const TabviewExampleScreen(),
    ),
    GoRoute(
      name: 'NavigationRail',
      path: '/NavigationRail',
      builder: (context, state) => const NavigationRailExampleScreen(),
    ),
    GoRoute(
      name: 'PageView',
      path: '/PageView',
      builder: (context, state) => const PageViewExampleScreen(),
    ),
    GoRoute(
      name: 'Hero',
      path: '/Hero',
      builder: (context, state) => const HeroExampleScreen(),
    ),
  ],
);
