import 'package:totalx_machine_task/src/feature/auth/domain/repositories/auth_repository.dart';

class VerifyOtpUsecase {
  final AuthRepository authRepository;

  VerifyOtpUsecase({required this.authRepository});

  Future<String> call(String verificationId, String userOtp) async {
    return await authRepository.verifyOtp(verificationId, userOtp);
  }
}
