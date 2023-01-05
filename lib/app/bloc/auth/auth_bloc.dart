import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/profile_model.dart';
import '../../repositories/auth/auth_repo_imp.dart';
import '../../repositories/local/local_repo_imp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepoImp authRepo;
  final LocalRepoImp localRepo;

  AuthBloc(this.authRepo, this.localRepo) : super(AuthInitial()) {
    on<CheckAuth>(_onCheckAuth);
    on<Login>(_onLogin);
    on<Register>(_onRegister);
    on<RequestVerificationEmail>(_onRequestVerificationEmail);
    on<RequestResetPassword>(_onRequestResetPassword);
    on<Logout>(_onLogout);
    on<GetProfile>(_onGetProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  FutureOr<void> _onCheckAuth(CheckAuth event, Emitter<AuthState> emit) async {
    var token = await localRepo.fetchToken();

    if (token != null) {
      emit(const IsAuth(true));
    } else {
      emit(const IsAuth(false));
    }
  }

  FutureOr<void> _onLogin(Login event, Emitter<AuthState> emit) async {
    emit(AuthLoginLoading());
    try {
      var data = {
        'email': event.email,
        'password': event.password,
      };
      var response = await authRepo.login(data);
      localRepo.storeToken(response['access_token']);
      emit(AuthLoginSuccess(response));
    } catch (e) {
      emit(AuthLoginFailure(e.toString()));
    }
  }

  FutureOr<void> _onRegister(Register event, Emitter<AuthState> emit) async {
    emit(AuthRegisterLoading());
    try {
      var data = {
        'name': event.name,
        'email': event.email,
        'phone': event.phone,
        'password': event.password,
        'password_confirmation': event.passwordConfirmation,
      };

      await authRepo.register(data);
      emit(AuthRegisterSuccess());
    } catch (e) {
      emit(AuthRegisterFailure(e.toString()));
    }
  }

  FutureOr<void> _onLogout(Logout event, Emitter<AuthState> emit) async {
    try {
      localRepo.deleteToken();
    } catch (_) {
      //
    }
  }

  FutureOr<void> _onGetProfile(
      GetProfile event, Emitter<AuthState> emit) async {
    emit(AuthProfileLoading());
    try {
      var response = await authRepo.getProfile();
      emit(AuthProfileFetched(response!));
    } catch (e) {
      emit(AuthProfileError(e.toString()));
    }
  }

  FutureOr<void> _onUpdateProfile(
      UpdateProfile event, Emitter<AuthState> emit) async {
    emit(AuthProfileLoading());
    try {
      var data = {
        'name': event.name,
        'phone': event.phone,
      };

      var response = await authRepo.updateProfile(data);

      emit(AuthProfileUpdated());
    } catch (e) {
      emit(AuthProfileError(e.toString()));
    }
  }

  FutureOr<void> _onRequestVerificationEmail(
      RequestVerificationEmail event, Emitter<AuthState> emit) async {
    emit(AuthRequestVerifEmailLoading());
    try {
      var response = await authRepo.requestVerificationEmail();
      debugPrint(response);
      emit(AuthRequestVerifEmailSuccess());
    } catch (e) {
      emit(AuthRequestVerifEmailFailure(e.toString()));
    }
  }

  FutureOr<void> _onRequestResetPassword(
      RequestResetPassword event, Emitter<AuthState> emit) async {
    emit(AuthRequestResetPasswordLoading());
    try {
      var data = {
        'email': event.email,
      };
      var response = await authRepo.requestResetPassword(data);

      emit(AuthRequestResetPasswordSuccess());
    } catch (e) {
      emit(AuthRequestResetPasswordFailure(e.toString()));
    }
  }
}
