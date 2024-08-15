import 'package:totalx_machine_task/src/feature/user_management/domain/entities/user_entity.dart';

abstract class ManageUserRepository {
  Future<void> addUser(UserEntity user);
  Future<List<UserEntity>> getAllUsers();
}
