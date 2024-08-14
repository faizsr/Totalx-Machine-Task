import 'package:shared_preferences/shared_preferences.dart';
import 'package:totalx_machine_task/src/feature/auth/data/data_source/local/auth_local_datasource.dart';

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferences sharedPreferences;

  AuthLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<bool> getLoginStatus() async {
    return sharedPreferences.getBool('LOGIN-STATUS') ?? false;
  }

  @override
  Future<void> saveLoginStatus(bool status) async {
    await sharedPreferences.setBool('LOGIN-STATUS', status);
  }
}
