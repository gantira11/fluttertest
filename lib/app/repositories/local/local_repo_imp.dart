import '../../core/utils/constants.dart';
import '../../data/local/local_service.dart';
import 'local_repository.dart';

class LocalRepoImp extends LocalRepo {
  LocalRepoImp(this.localService);

  final LocalService localService;

  @override
  Future<String?> fetchToken() async {
    final response = await localService.fetch(Constants.TOKEN_KEY);
    return response;
  }

  @override
  Future<void> storeToken(String data) async {
    localService.store(Constants.TOKEN_KEY, data);
  }

  @override
  Future<void> deleteToken() async {
    localService.delete(Constants.TOKEN_KEY);
  }
}
