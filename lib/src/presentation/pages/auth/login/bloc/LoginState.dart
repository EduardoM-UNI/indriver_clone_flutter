import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

// Se define las variables que van a cambiar

class LoginState extends Equatable{

  final Blocformitem email;
  final Blocformitem password;
  final GlobalKey<FormState> ? formkey;

  const LoginState({
    this.email = const Blocformitem(error: 'Enter a valid email'),
    this.password = const Blocformitem(error: 'Enter a valid password'),
    this.formkey
  });

  LoginState copyWith({
      Blocformitem? email,
      Blocformitem? password,
      GlobalKey<FormState> ? formkey,
  }) {
      return LoginState( //null validate
        email: email ?? this.email,
        password: password ?? this.password,
        formkey: formkey
      );
  }

  
  @override
  List<Object?> get props => [email, password];
}