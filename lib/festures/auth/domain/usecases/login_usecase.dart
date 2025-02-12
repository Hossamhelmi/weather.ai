import 'package:dartz/dartz.dart';
import 'package:weather_ai/festures/auth/domain/entity/user.dart';
import 'package:weather_ai/festures/auth/domain/repo/base_auth_repo.dart';

class LoginUsecase {
  final BaseAuthRepo _authRepository;

  LoginUsecase(this._authRepository);

  Future<Either<Exception, User>> call(String email,String password) async {
    return await _authRepository.loginWithEmailAndPassword(email,password);
  }
}