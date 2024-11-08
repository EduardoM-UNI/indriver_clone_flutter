import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

abstract class RegisterEvent {}


// Se define los eventos

class RegisterInitEvent extends RegisterEvent {}

class NameChanged extends RegisterEvent {
  final BlocFormitem name;
  NameChanged({required this.name});
}

class LastNameChanged extends RegisterEvent {
  final BlocFormitem lastname;
  LastNameChanged({required this.lastname});
}

class EmailChanged extends RegisterEvent {
  final BlocFormitem email;
  EmailChanged({required this.email});
}

class PhoneChanged extends RegisterEvent {
  final BlocFormitem phone;
  PhoneChanged({required this.phone});
}

class PasswordChanged extends RegisterEvent {
  final BlocFormitem password;
  PasswordChanged({required this.password});
}

class ConfirmPasswordChanged extends RegisterEvent {
  final BlocFormitem confirmPassword;
  ConfirmPasswordChanged({required this.confirmPassword});
}

class FormSubmit extends RegisterEvent {}

class FormReset extends RegisterEvent {}