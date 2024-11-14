import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:indriver_clone_flutter/src/domain/utils/Resource.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';
// Se registra el evento

class LoginBloc extends Bloc<LoginEvent,LoginState> {

  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();
 // Authservice authservice = Authservice();
 // LoginUseCase loginUseCase = LoginUseCase();
  //AuthUseCases authUseCases = AuthUseCases(login: login);

  LoginBloc(this.authUseCases): super(LoginState()){

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

      on <FormSubmit>((event, emit) async {
        print('Email:  ${state.email.value}');
        print('Password:  ${state.password.value}');
        emit(
          state.copyWith(
            response: Loading(),
            formkey: formKey
          )
        );
        Resource response = await authUseCases.login.run(state.email.value, state.password.value);
        emit(
          state.copyWith(
            response: response,
            formkey: formKey
          )
        );
    });
  }
}