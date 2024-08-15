import 'package:totalx_machine_task/src/feature/user_management/data/data_source/remote/manage_user_data_source.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/entities/user_entity.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/repositories/manage_user_repository.dart';

class ManageUserRepositoryImpl implements ManageUserRepository {
  final ManageUserDataSource manageUserDataSource;

  ManageUserRepositoryImpl({required this.manageUserDataSource});

  @override
  Future<void> addUser(UserEntity user) async {
    await manageUserDataSource.addUser(user);
  }

  @override
  Stream<List<UserEntity>> getAllUsers() {
    return manageUserDataSource.getAllUsers();
  }
}
