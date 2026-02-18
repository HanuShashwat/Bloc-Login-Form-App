import 'package:bloc_login_form_app/bloc/auth_bloc.dart';
import 'package:bloc_login_form_app/login_screen.dart';
import 'package:bloc_login_form_app/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const LoginScreen(),
            ),
                (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(state.uid),
                  const SizedBox(height: 30),
                  GradientButton(
                    text: "Log out",
                    onPressed: () {
                      context
                        .read<AuthBloc>()
                        .add(AuthLogoutRequested());
                    },
                  ),
                ],
              ),
            ),
          );
        }
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is AuthError) {
          return Scaffold(
            body: Center(child: Text(state.error)),
          );
        }
        return const Scaffold(
          body: Center(child: Text("Not logged in")),
        );
      },
    );
  }
}