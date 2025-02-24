import 'package:dartz/dartz.dart';
import 'package:weather_ai/festures/auth/domain/entity/user.dart';

abstract class BaseAuthRepo {
  Future<Either<Exception, User>> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Exception, User>> signUpWithEmailAndPassword(
      {required String email,required String password,required String fullName});
}
