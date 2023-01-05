part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckAuth extends AuthEvent {}

class Login extends AuthEvent {
  const Login(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class Register extends AuthEvent {
  const Register(
    this.name,
    this.email,
    this.phone,
    this.password,
    this.passwordConfirmation,
  );

  final String name;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;

  @override
  List<Object> get props => [
        name,
        email,
        password,
        password,
        passwordConfirmation,
      ];
}

class RequestVerificationEmail extends AuthEvent {}

class RequestResetPassword extends AuthEvent {
  const RequestResetPassword(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class Logout extends AuthEvent {}

class GetProfile extends AuthEvent {}

class UpdateProfile extends AuthEvent {
  const UpdateProfile(this.name, this.phone);

  final String name;
  final String phone;

  @override
  List<Object> get props => [name, phone];
}
