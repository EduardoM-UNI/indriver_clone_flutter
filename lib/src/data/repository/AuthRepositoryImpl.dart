import 'package:indriver_clone_flutter/src/data/dataSource/remote/service/AuthService.dart';
import 'package:indriver_clone_flutter/src/domain/Repository/AuthRepository.dart';
import 'package:indriver_clone_flutter/src/domain/models/AuthResponse.dart';
import 'package:indriver_clone_flutter/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements Authrepository{

  AuthService authService;
  AuthRepositoryImpl(this.authService);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    
    return authService.login(email, password);

  }
}