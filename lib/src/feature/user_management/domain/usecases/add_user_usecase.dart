import 'package:totalx_machine_task/src/feature/user_management/domain/entities/user_entity.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/repositories/manage_user_repository.dart';

class AddUserUsecase {
  final ManageUserRepository manageUserRepository;

  AddUserUsecase({required this.manageUserRepository});

  Future<void> call(UserEntity user) async {
    await manageUserRepository.addUser(user);
  }
}
