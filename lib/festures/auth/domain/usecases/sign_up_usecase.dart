import 'package:dartz/dartz.dart';
import 'package:weather_ai/festures/auth/domain/entity/user.dart';
import 'package:weather_ai/festures/auth/domain/repo/base_auth_repo.dart';

class SignUpUsecase {
  final BaseAuthRepo _baseAuthRepo;

  SignUpUsecase(this._baseAuthRepo);

  Future<Either<Exception, User>> call(
      {required String email,
      required String password,
      required String fullName}) async {
    return await _baseAuthRepo.signUpWithEmailAndPassword(
        email: email, password: password, fullName: fullName);
  }
}
