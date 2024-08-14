import 'package:flutter/material.dart';

abstract class AuthRepository {
  Future<void> sendOtp(String number, BuildContext context);
  Future<String> verifyOtp(String verificationId, String userOtp);
  Future<void> logout();
  Future<void> saveLoginStatus(bool status);
  Future<bool> getLoginStatus();
}
