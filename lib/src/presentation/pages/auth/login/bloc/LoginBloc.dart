import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';
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
            email: BlocFormitem(
                value: event.email.value,
                error: event.email.value.isEmpty ? 'Enter a email' : null
            ),
            formkey: formKey
          )
        );
    });
    on <PasswordChanged>((event, emit) {
          emit(
            state.copyWith(
             password: BlocFormitem(
                value: event.password.value,
                error: event.password.value.isEmpty 
                ? 'Enten a password' : event.password.value.length < 6
                  ? 'Min 6 characters'
                  : null
            ),
              formkey: formKey
            )
          );
      });

      on <FormSubmit>((event, emit) {
        print('Email:  ${state.email.value}');
        print('Password:  ${state.password.value}');
    });
  }
}