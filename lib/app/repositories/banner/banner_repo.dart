import '../../models/banner_model.dart';

abstract class BannerRepo {
  Future<List<BannerModel>?> getBanners();
}
