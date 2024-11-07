import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// Se define las variables que van a cambiar

class LoginState extends Equatable{

  final String email;
  final String password;
  final GlobalKey<FormState> ? formkey;

  const LoginState({
    this.email = '',
    this.password = '',
    this.formkey
  });

  LoginState copyWith({
      String? email,
      String? password,
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