abstract class BaseServiceNetwork {
  Future<dynamic> fetch(String url);
  Future<dynamic> store(String url, dynamic data);
  Future<dynamic> storeWithParams(
    String url,
    dynamic data,
    Map<String, dynamic> queryParams,
  );
  Future<dynamic> update(String url, dynamic data);
  Future<dynamic> delete(String url);
}
