import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/auth/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => context.read<AuthBloc>().add(CheckAuth()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is IsAuth) {
            if (state.isAuth) {
              Navigator.pushReplacementNamed(context, '/home');
            } else {
              Navigator.pushReplacementNamed(context, '/login');
            }
          }
        },
        child: Center(
          child: SvgPicture.asset(
            'assets/images/register.svg',
            width: 220,
          ),
        ),
      ),
    );
  }
}
