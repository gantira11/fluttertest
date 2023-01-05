import 'package:fluttertest/app/data/remote/api_network_service.dart';
import 'package:fluttertest/app/models/banner_model.dart';
import 'package:fluttertest/app/repositories/banner/banner_repo.dart';

class BannerRepoImp extends BannerRepo {
  BannerRepoImp(this.networkService);

  final ApiNetworkService networkService;

  @override
  Future<List<BannerModel>?> getBanners() async {
    try {
      final response = await networkService.fetch('/banner');

      return List<BannerModel>.from(
          response.map((e) => BannerModel.fromJson(e)));
    } catch (_) {
      rethrow;
    }
  }
}
