import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

// Se define las variables que van a cambiar

class LoginState extends Equatable{

  final BlocFormitem email;
  final BlocFormitem password;
  final GlobalKey<FormState> ? formkey;

  const LoginState({
    this.email = const BlocFormitem(error: 'Enter a valid email'),
    this.password = const BlocFormitem(error: 'Enter a valid password'),
    this.formkey
  });

  LoginState copyWith({
      BlocFormitem? email,
      BlocFormitem? password,
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