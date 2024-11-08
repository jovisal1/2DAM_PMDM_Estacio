// Define the routes using go_router
import 'package:flutter_firebase_login/domain/repositories/sign_in_repository.dart';
import 'package:flutter_firebase_login/injection.dart';
import 'package:flutter_firebase_login/presentation/screens/login_page.dart';
import 'package:flutter_firebase_login/presentation/screens/user_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(path: '/user', builder: (context, state) => const UserPage()),
  ],
  redirect: (context, state) async {
    final isLoggedIn = await sl<SignInRepository>().isLoggedIn();
    return isLoggedIn.fold((_) => '/login', (loggedIn) {
      if (loggedIn == "NO_USER" && !state.matchedLocation.contains("/login")) {
        return "/login";
      } else {
        return state.matchedLocation;
      }
    });
  },
);
