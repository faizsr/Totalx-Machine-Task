import 'package:flutter/material.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/repositories/auth_repository.dart';

class SendOtpUsecase {
  final AuthRepository authRepository;

  SendOtpUsecase({required this.authRepository});

  Future<void> call(String number, BuildContext context) async {
    await authRepository.sendOtp(number, context);
  }
}
