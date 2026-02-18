import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc <AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final email = event.email;
        final password = event.password;

        if (password.length < 6) {
          return emit(
            AuthError(
              'Password must be at least 6 characters',
            ),
          );
        }

        await Future.delayed(
            const Duration(seconds: 1), () {
          return emit(AuthSuccess(uid: '$email-$password'));
        }
        );
      } catch (e) {
        return emit(AuthError(e.toString()));
      }
    });
  }
}
