import 'package:totalx_machine_task/src/feature/auth/domain/repositories/auth_repository.dart';

class GetLoginStatusUsecase {
  final AuthRepository authRepository;

  GetLoginStatusUsecase({required this.authRepository});

  Future<bool> call() async {
    return await authRepository.getLoginStatus();
  }
}
