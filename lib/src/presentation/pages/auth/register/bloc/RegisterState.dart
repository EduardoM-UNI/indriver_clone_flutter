import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class Registerstate extends Equatable{

//Estados 

  final BlocFormitem name;
  final BlocFormitem lastname;
  final BlocFormitem email;
  final BlocFormitem phone;
  final BlocFormitem password;
  final BlocFormitem confirmPassword;
  final GlobalKey<FormState>? formKey;

  const Registerstate({
    this.name = const BlocFormitem(error: 'Enter the name'),
    this.lastname = const BlocFormitem(error: 'Enter the lastname'),
    this.email = const BlocFormitem(error: 'Enter the email'),
    this.phone = const BlocFormitem(error: 'Enter the phone'),
    this.password = const BlocFormitem(error: 'Enter the password'),
    this.confirmPassword = const BlocFormitem(error: 'Enter the confirm'),
    this.formKey,
  });

  Registerstate copyWith({
     BlocFormitem? name,
     BlocFormitem? lastname,
     BlocFormitem? email,
     BlocFormitem? phone,
     BlocFormitem? password,
     BlocFormitem? confirmPassword,
     GlobalKey<FormState>? formKey

  }){
      return Registerstate(
        name: name ?? this.name,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        formKey: formKey
      );
  }

  @override
  List<Object?> get props => [
    name,
    lastname,
    email,
    phone,
    password,
    confirmPassword
  ];

}