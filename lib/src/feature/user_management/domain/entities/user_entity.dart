class UserEntity {
  String? id;
  final String name;
  final int age;
  String? profile;

  UserEntity({
    this.id,
    required this.name,
    required this.age,
    this.profile,
  });
}
