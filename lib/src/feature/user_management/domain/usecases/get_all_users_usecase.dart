import 'package:totalx_machine_task/src/feature/user_management/domain/entities/user_entity.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/repositories/manage_user_repository.dart';

class GetAllUsersUsecase {
  final ManageUserRepository manageUserRepository;

  GetAllUsersUsecase({required this.manageUserRepository});

  Future<List<UserEntity>> call() async {
    return await manageUserRepository.getAllUsers();
  }
}
