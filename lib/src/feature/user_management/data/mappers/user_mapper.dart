import 'package:totalx_machine_task/src/feature/user_management/data/models/user_model.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/entities/user_entity.dart';

class UserMapper {
  static UserEntity mapToEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      age: model.age,
      profile: model.profile,
    );
  }

  static UserModel mapToModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      age: entity.age,
      profile: entity.profile,
    );
  }
}
