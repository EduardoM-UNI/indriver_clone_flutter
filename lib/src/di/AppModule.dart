import 'package:indriver_clone_flutter/src/data/Repository/AuthRepositoryImpl.dart';
import 'package:indriver_clone_flutter/src/data/dataSource/remote/service/AuthService.dart';
import 'package:indriver_clone_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Appmodule {

@injectable
AuthService get authService => AuthService();

@injectable
AuthRepositoryImpl get authRepository => AuthRepositoryImpl(authService);

@injectable
AuthUseCases get authUsesCases => AuthUseCases(
  login: LoginUseCase(authRepository));

}