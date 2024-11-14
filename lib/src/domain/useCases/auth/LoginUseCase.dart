import 'package:indriver_clone_flutter/src/data/Repository/AuthRepositoryImpl.dart';
import 'package:indriver_clone_flutter/src/domain/Repository/AuthRepository.dart';

class LoginUseCase {
  Authrepository repository;
  LoginUseCase(this.repository);
  run(String email, String password) => repository.login(email, password);
}