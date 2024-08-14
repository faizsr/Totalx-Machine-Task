import 'package:flutter/material.dart';

abstract class AuthRemoteDatasource {
  Future<void> sendOtp(String number, BuildContext context);
  Future<String> verifyOtp(String verificationId, String userOtp);
  Future<void> logout();
}
