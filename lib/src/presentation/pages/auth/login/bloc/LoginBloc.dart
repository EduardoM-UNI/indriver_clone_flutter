import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';

// Se registra el evento

class LoginBloc extends Bloc<LoginEvent,LoginState> {

  final formKey = GlobalKey<FormState>();

  LoginBloc(): super(LoginState()){

    on<LoginInitEvent> ((event, emit) {
       emit(state.copyWith(formkey: formKey)); 
    });

    on <EmailChanged>((event, emit) {
        emit(
          state.copyWith(
            email: event.email,
            formkey: formKey
          )
        );
    });
    on <PasswordChanged>((event, emit) {
          emit(
            state.copyWith(
              password: event.password,
              formkey: formKey
            )
          );
      });

      on <FormSubmit>((event, emit) {
        print('Email:  ${state.email}');
        print('Password:  ${state.password}');
    });
  }
}