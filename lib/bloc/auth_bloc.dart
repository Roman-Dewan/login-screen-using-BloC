import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    // login request
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final email = event.email;
        final password = event.password;
        // validator.
        if (email.isEmpty || password.isEmpty) {
          emit(AuthFailure('Please enter your email and password'));
        } else if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+').hasMatch(email)) {
          emit(AuthFailure('Please enter a valid email'));
        } else if (password.length < 6) {
          emit(AuthFailure('Password must be at least 6 characters long'));
        } else {
          await Future.delayed(const Duration(seconds: 2), () {
            return emit(AuthSuccess(uid: '$email - $password'));
          });
        }
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });
    
    // logOut request
    on<AuthLogOutRequested>((event, emit)async{
      emit(AuthLoading());
      try {
        await Future.delayed(const Duration(seconds: 2), (){
          return emit(AuthInitial());
        });
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
