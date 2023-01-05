part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class IsAuth extends AuthState {
  const IsAuth(this.isAuth);

  final bool isAuth;
}

class AuthLoginLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  const AuthLoginSuccess(this.response);

  final dynamic response;

  @override
  List<Object> get props => [response];
}

class AuthLoginFailure extends AuthState {
  const AuthLoginFailure(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

class AuthRequestVerifEmailLoading extends AuthState {}

class AuthRequestVerifEmailSuccess extends AuthState {}

class AuthRequestVerifEmailFailure extends AuthState {
  const AuthRequestVerifEmailFailure(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

class AuthRequestResetPasswordLoading extends AuthState {}

class AuthRequestResetPasswordSuccess extends AuthState {}

class AuthRequestResetPasswordFailure extends AuthState {
  const AuthRequestResetPasswordFailure(this.error);

  final String error;

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class AuthRegisterLoading extends AuthState {}

class AuthRegisterSuccess extends AuthState {}

class AuthRegisterFailure extends AuthState {
  const AuthRegisterFailure(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

class AuthProfileLoading extends AuthState {}

class AuthProfileFetched extends AuthState {
  const AuthProfileFetched(this.profile);

  final Profile profile;

  @override
  List<Object> get props => [profile];
}

class AuthProfileError extends AuthState {
  const AuthProfileError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

class AuthProfileUpdated extends AuthState {}
