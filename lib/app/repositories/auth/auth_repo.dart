import 'dart:async';

import '../../models/profile_model.dart';

abstract class AuthRepo {
  Future login(dynamic data);
  Future register(dynamic data);
  Future logout();
  Future requestResetPassword(dynamic data);
  Future resetPassword(dynamic queryParams);
  Future requestVerificationEmail();
  Future emailVerify(dynamic queryParams);

  Future<Profile?> getProfile();
  Future updateProfile(dynamic data);
}
