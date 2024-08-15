import 'package:flutter/material.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/usecases/logout_usecase.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/usecases/send_otp_usecase.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/usecases/set_login_status_usecase.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/usecases/verify_otp_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final SendOtpUsecase sendOtpUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;
  final LogoutUsecase logoutUsecase;
  final SetLoginStatusUsecase setLoginStatusUsecase;

  AuthProvider({
    required this.sendOtpUsecase,
    required this.verifyOtpUsecase,
    required this.logoutUsecase,
    required this.setLoginStatusUsecase,
  });

  bool isLoading = false;
  String result = '';

  Future<void> sentOtp(String number, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await sendOtpUsecase.call(number, context);
    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();
  }

  Future<String> verifyOtp(String verficationId, String userOtp) async {
    isLoading = true;
    notifyListeners();

    final response = await verifyOtpUsecase.call(verficationId, userOtp);
    result = response;
    notifyListeners();
    await setLoginStatusUsecase.call(true);

    isLoading = false;
    notifyListeners();
    return response;
  }

  Future<void> logout() async {
    await logoutUsecase.call();
  }
}
