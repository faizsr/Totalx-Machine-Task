abstract class AuthLocalDatasource {
  Future<void> saveLoginStatus(bool status);
  Future<bool> getLoginStatus();
}
