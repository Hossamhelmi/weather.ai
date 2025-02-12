part of 'auth_cubit.dart';

@immutable
 class AuthState {}

final class AuthInitial  extends AuthState {}
final class AuthLoading  extends AuthState {}
final class AuthError  extends AuthState {
  final String message;
  AuthError(this.message);
}
final class AuthSuccess  extends AuthState {
  final User user;
  AuthSuccess(this.user);
}