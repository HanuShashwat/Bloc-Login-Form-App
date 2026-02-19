import 'package:bloc_login_form_app/bloc/auth_bloc.dart';
import 'package:bloc_login_form_app/pallete.dart';
import 'package:bloc_login_form_app/widgets/app_bloc_observer.dart';
import 'package:bloc_login_form_app/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Pallete.backgroundColor,
        ),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return const HomeScreen();
            }
            return const LoginScreen();
          }
        )
      ),
    );
  }
}