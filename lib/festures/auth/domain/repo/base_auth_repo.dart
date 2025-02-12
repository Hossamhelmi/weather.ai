import 'package:dartz/dartz.dart';
import 'package:weather_ai/festures/auth/domain/entity/user.dart';

abstract class BaseAuthRepo {
  Future<Either<Exception, User>> loginWithEmailAndPassword(String email, String password);

  Future<Either<Exception, User>> signUpWithEmailAndPassword(String email, String password, String fullName);
}
