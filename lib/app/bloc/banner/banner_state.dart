part of 'banner_bloc.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerLoading extends BannerState {}

class BannerFetched extends BannerState {
  const BannerFetched(this.listBanner);

  final List<BannerModel> listBanner;

  @override
  List<Object> get props => [listBanner];
}

class BannerError extends BannerState {
  const BannerError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
