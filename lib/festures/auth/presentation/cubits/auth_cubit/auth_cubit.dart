// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:weather_ai/festures/auth/domain/entity/user.dart';
import 'package:weather_ai/festures/auth/domain/usecases/login_usecase.dart';
import 'package:weather_ai/festures/auth/domain/usecases/sign_up_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase loginUsecase;
  final SignUpUsecase signUpUsecase;
  AuthCubit(this.loginUsecase, this.signUpUsecase) : super(AuthInitial());

  Future<void> signUp(
      {required String email,
      required String password,
      required String fullname}) async {
    emit(AuthLoading());

    final Either<Exception, User> result = await signUpUsecase(
        email: email, password: password, fullName: fullname);

    result.fold(
      (erorr) => emit(AuthError(erorr.toString())),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    final Either<Exception, User> result = await loginUsecase(email, password);

    result.fold(
      (erorr) => emit(AuthError(erorr.toString())),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
