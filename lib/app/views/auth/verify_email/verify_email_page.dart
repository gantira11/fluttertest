import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertest/app/bloc/auth/auth_bloc.dart';

import '../../../core/utils/dimensions.dart';
import '../../../core/utils/text_styles.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: ((context, state) {
          if (state is AuthRequestVerifEmailSuccess) {
            EasyLoading.showSuccess('Email verifikasi telah dikirim');
          }

          if (state is AuthRequestResetPasswordFailure) {
            EasyLoading.showInfo('Terjadi kesalahan');
            Navigator.pop(context);
          }
        }),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  SvgPicture.asset('assets/images/verify.svg'),
                  const Text(
                    'Verifikasi Email',
                    style: TextStyles.TEXT_HEADING,
                  ),
                  const SizedBox(height: Dimensions.GAP_SIZE_DEFAULT),
                  const Text('Verifikasi Email anda untuk melanjutkan')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
