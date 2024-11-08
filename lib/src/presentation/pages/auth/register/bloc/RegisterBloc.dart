import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

// Se registra el evento

class RegisterBloc extends Bloc<RegisterEvent,Registerstate>{

  final formKey = GlobalKey<FormState>();

  RegisterBloc():super(Registerstate()){

    on<RegisterInitEvent> ((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on <NameChanged>((event, emit) {
        emit(
          state.copyWith(
            name: BlocFormitem(
                value: event.name.value,
                error: event.name.value.isEmpty ? 'Enter a email' : null
            ),
            formKey: formKey
          )
        );
    });

    on <LastNameChanged>((event, emit) {
        emit(
          state.copyWith(
            lastname: BlocFormitem(
                value: event.lastname.value,
                error: event.lastname.value.isEmpty ? 'Enter a Surname' : null
            ),
            formKey: formKey
          )
        );
    });

    on <EmailChanged>((event, emit) {
        emit(
          state.copyWith(
            email: BlocFormitem(
                value: event.email.value,
                error: event.email.value.isEmpty ? 'Enter a email' : null
            ),
            formKey: formKey
          )
        );
    });

    on <PhoneChanged>((event, emit) {
        emit(
          state.copyWith(
            phone: BlocFormitem(
                value: event.phone.value,
                error: event.phone.value.isEmpty ? 'Enter a phone' : null
            ),
            formKey: formKey
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
              formKey: formKey
            )
          );
      });

    on <ConfirmPasswordChanged>((event, emit) {
          emit(
            state.copyWith(
             confirmPassword: BlocFormitem(
                value: event.confirmPassword.value,
                error: event.confirmPassword.value.isEmpty 
                ? 'Enten a password' : event.confirmPassword.value.length < 6
                  ? 'Min 6 characters'
                  :event.confirmPassword.value != state.password.value
                  ?  'Password not match'
                  : null
            ),
              formKey: formKey
            )
          );
      });

      on <FormSubmit>((event, emit) {
        print('Name:  ${state.name.value}');
        print('LastName:  ${state.lastname.value}');
        print('Email:  ${state.email.value}');
        print('Phone:  ${state.phone.value}');
        print('Password:  ${state.password.value}');
        print('CPassword:  ${state.confirmPassword.value}');
    });

      on<FormReset>((event, emit) {
        // TODO: implement event handler
        state.formKey?.currentState?.reset();
      });

  }
}