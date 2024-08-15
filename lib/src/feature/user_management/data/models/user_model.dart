import 'package:totalx_machine_task/src/feature/user_management/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.id,
    required super.name,
    required super.age,
    super.profile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      profile: json['profile'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'profile': profile,
    };
  }
}
