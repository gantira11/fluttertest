import 'dart:async';
import 'dart:convert';

import 'package:fluttertest/app/models/profile_model.dart';
import 'package:http/http.dart';

import '../../data/remote/api_network_service.dart';
import 'auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  AuthRepoImp(this.networkService);

  final ApiNetworkService networkService;

  @override
  Future login(data) async {
    try {
      final response = await networkService.store('/login', data);

      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future register(data) async {
    try {
      final response = await networkService.store('/register', data);

      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future logout() async {
    try {
      final response = await networkService.store('/logout', null);

      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future requestResetPassword(data) async {
    try {
      final response =
          await networkService.store('/password/reset-request', data);

      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future resetPassword(queryParams) async {
    try {
      final response = await networkService.storeWithParams(
        '/password/reset',
        null,
        queryParams,
      );

      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future requestVerificationEmail() async {
    try {
      final response =
          await networkService.store('/email/request-verification', null);

      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future emailVerify(queryParams) async {
    try {
      final response = await networkService.storeWithParams(
        'email/verify',
        null,
        queryParams,
      );

      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Profile?> getProfile() async {
    try {
      final response = await networkService.fetch('/user-profile');

      return Profile.fromJson(response);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Object> updateProfile(data) async {
    try {
      final response = await networkService.store('/user-profile/update', data);

      return response;
    } catch (_) {
      rethrow;
    }
  }
}
