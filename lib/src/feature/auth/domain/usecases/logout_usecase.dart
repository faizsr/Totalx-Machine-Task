import 'package:totalx_machine_task/src/feature/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});

  Future<void> call() async {
    await authRepository.logout();
  }
}
