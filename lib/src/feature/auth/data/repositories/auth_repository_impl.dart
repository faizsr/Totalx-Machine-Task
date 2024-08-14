import 'package:flutter/src/widgets/framework.dart';
import 'package:totalx_machine_task/src/feature/auth/data/data_source/local/auth_local_datasource.dart';
import 'package:totalx_machine_task/src/feature/auth/data/data_source/remote/auth_remote_datasource.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthLocalDatasource authLocalDatasource;

  AuthRepositoryImpl({
    required this.authRemoteDatasource,
    required this.authLocalDatasource,
  });

  @override
  Future<bool> getLoginStatus() async {
    return await authLocalDatasource.getLoginStatus();
  }

  @override
  Future<void> saveLoginStatus(bool status) async {
    await authLocalDatasource.saveLoginStatus(status);
  }

  @override
  Future<void> sendOtp(String number, BuildContext context) async {
    await authRemoteDatasource.sendOtp(number, context);
  }

  @override
  Future<String> verifyOtp(String verificationId, String userOtp) async {
    return await authRemoteDatasource.verifyOtp(verificationId, userOtp);
  }

  @override
  Future<void> logout() async {
    await authRemoteDatasource.logout();
  }
}
