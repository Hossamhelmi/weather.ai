import 'package:dartz/dartz.dart';
import 'package:weather_ai/festures/auth/domain/entity/user.dart';
import 'package:weather_ai/festures/auth/domain/repo/base_auth_repo.dart';

class SignUpUsecase {
  final BaseAuthRepo _baseAuthRepo;

  SignUpUsecase(this._baseAuthRepo);

  Future<Either<Exception, User>> call( String email,String password ,String fullName) async {
    return await _baseAuthRepo.signUpWithEmailAndPassword(email, password, fullName);
  }
}