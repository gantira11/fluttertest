import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app/bloc/auth/auth_bloc.dart';
import 'app/bloc/banner/banner_bloc.dart';
import 'app/config/dependency_injector/service_locator.dart';
import 'app/config/router/app_router.dart';
import 'app/core/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(getIt(), getIt())),
        BlocProvider(create: (_) => BannerBloc(getIt())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Smooets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        scaffoldBackgroundColor: AppColors.SCAFFOLD,
        fontFamily: 'Lato',
      ),
      builder: EasyLoading.init(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
