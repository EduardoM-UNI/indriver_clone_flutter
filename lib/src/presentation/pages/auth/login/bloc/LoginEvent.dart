import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

abstract class LoginEvent {}


// Se define los eventos

class LoginInitEvent extends LoginEvent {}

class EmailChanged extends LoginEvent {
  final Blocformitem email;
  EmailChanged({required this.email});
}

class PasswordChanged extends LoginEvent {
  final Blocformitem password;
  PasswordChanged({required this.password});
}

class FormSubmit extends LoginEvent {}