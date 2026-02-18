import 'package:bloc_login_form_app/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: Center(
              child: Text(state.uid),
            ),
          );
        }  if (state is AuthLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } if (state is AuthError) {
          return Scaffold(
            body: Center(
              child: Text(state.error),
            ),
          );
        } return const Scaffold(
          body: Center(child: Text("Not logged in")),
        );
      },
    );
  }
}
