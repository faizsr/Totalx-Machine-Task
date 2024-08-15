import 'package:totalx_machine_task/src/feature/user_management/domain/entities/user_entity.dart';

abstract class ManageUserDataSource {
  Future<void> addUser(UserEntity user);
  Stream<List<UserEntity>> getAllUsers();
}
