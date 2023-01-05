import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/banner_model.dart';
import '../../repositories/banner/banner_repo_imp.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepoImp bannerRepo;

  BannerBloc(this.bannerRepo) : super(BannerLoading()) {
    // on<BannerEvent>((event, emit) {});
    on<FetchBanner>(_onFetchBanner);
  }

  FutureOr<void> _onFetchBanner(
      FetchBanner event, Emitter<BannerState> emit) async {
    emit(BannerLoading());
    try {
      var response = await bannerRepo.getBanners();

      emit(BannerFetched(response!));
    } catch (e) {
      emit(BannerError(e.toString()));
    }
  }
}
