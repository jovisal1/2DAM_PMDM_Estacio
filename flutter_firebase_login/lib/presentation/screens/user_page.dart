import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/presentation/blocs/auth/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/presentation/blocs/auth/login_event.dart';
import 'package:flutter_firebase_login/presentation/blocs/auth/login_state.dart';
import 'package:go_router/go_router.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles del usuario'), actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Regresar al login
            context.read<LoginBloc>().add(LogoutButtonPressed());
            context.go('/login');
          },
        ),
      ]),
      body: Center(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.email != null && state.email != "NO_USER") {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        "El email en autenticado ahora mismo es: ${state.email!}")),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bienvenido!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ahora estás logueado como:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  context.read<LoginBloc>().state.email ?? "NO_USER",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {context.read<LoginBloc>().add(CheckAuthentication())},
        child: const Icon(Icons.verified_user_rounded),
      ),
    );
  }
}
