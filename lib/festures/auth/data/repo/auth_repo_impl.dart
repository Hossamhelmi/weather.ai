import 'package:dartz/dartz.dart';
import 'package:weather_ai/festures/auth/data/data_source/remote_data_source.dart';
import 'package:weather_ai/festures/auth/data/model/user_model.dart';
import 'package:weather_ai/festures/auth/domain/entity/user.dart';
import 'package:weather_ai/festures/auth/domain/repo/base_auth_repo.dart';

class AuthRepoImpl implements BaseAuthRepo {
  final RemoteDataSource remoteDataSource;

  AuthRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, User>> signUpWithEmailAndPassword(
      String email, String password, String fullName) async {
    try {
      final userModel =
          await remoteDataSource.signUp(email, password, fullName);
      return Right( User(
      email: userModel.email,
      fullname: userModel.fullname!,
  ),);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, User>> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserModel userModel = await remoteDataSource.logIn(email, password);
     return Right( User(
      email: userModel.email,
      fullname: userModel.fullname!,
  ),);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
