import 'package:fluttertest/app/bloc/auth/auth_bloc.dart';
import 'package:fluttertest/app/bloc/banner/banner_bloc.dart';
import 'package:fluttertest/app/data/local/local_service.dart';
import 'package:fluttertest/app/repositories/auth/auth_repo_imp.dart';
import 'package:fluttertest/app/repositories/banner/banner_repo_imp.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/remote/api_network_service.dart';
import '../../repositories/local/local_repo_imp.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  final localStorage = await SharedPreferences.getInstance();

  getIt.registerLazySingleton(() => localStorage);

  // Services
  getIt.registerLazySingleton(() => ApiNetworkService(getIt()));
  getIt.registerLazySingleton(() => LocalService(getIt()));

  // Repositories
  getIt.registerLazySingleton(() => LocalRepoImp(getIt()));
  getIt.registerLazySingleton(() => AuthRepoImp(getIt()));
  getIt.registerLazySingleton(() => BannerRepoImp(getIt()));

  // Bloc
  getIt.registerFactory(() => AuthBloc(getIt(), getIt()));
  getIt.registerFactory(() => BannerBloc(getIt()));
}
