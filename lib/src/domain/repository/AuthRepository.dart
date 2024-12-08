import 'package:indriver_clone_flutter/src/domain/models/AuthResponse.dart';
import 'package:indriver_clone_flutter/src/domain/utils/Resource.dart';

abstract class AuthRepository {

  Future<Resource<AuthResponse>> login(String email, String password);

}