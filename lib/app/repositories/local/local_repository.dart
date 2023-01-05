abstract class LocalRepo {
  Future<void> fetchToken();
  Future<void> storeToken(String data);
  Future<void> deleteToken();
}
