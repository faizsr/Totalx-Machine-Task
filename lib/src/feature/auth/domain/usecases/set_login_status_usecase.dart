import 'package:totalx_machine_task/src/feature/auth/domain/repositories/auth_repository.dart';

class SetLoginStatusUsecase {
  final AuthRepository authRepository;

  SetLoginStatusUsecase({required this.authRepository});

  Future<void> call(bool status) async {
    await authRepository.saveLoginStatus(status);
  }
}
