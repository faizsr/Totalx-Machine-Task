import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/entities/user_entity.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/usecases/add_user_usecase.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/usecases/get_all_users_usecase.dart';

class ManageUserProvider extends ChangeNotifier {
  final GetAllUsersUsecase getAllUsersUsecase;
  final AddUserUsecase addUserUsecase;

  ManageUserProvider({
    required this.getAllUsersUsecase,
    required this.addUserUsecase,
  });

  bool addLoading = false;
  bool getLoading = false;

  List<UserEntity> users = [];

  getAllUser() async {
    getLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3));

    final dataStream = getAllUsersUsecase.call();
    dataStream.listen(
      (usersList) {
        users = usersList;
        getLoading = false;
        notifyListeners();
        log('Popular: ${users.length}');
      },
    ).onError((error) {
      log('Error from fetching all destinations: $error');
      addLoading = false;
      notifyListeners();
    });
  }

  addUser(UserEntity user) async {
    addLoading = true;
    notifyListeners();

    await addUserUsecase.call(user);
    addLoading = false;
    notifyListeners();
  }
}
