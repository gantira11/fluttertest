import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/text_styles.dart';
import '../../widgets/base_button.dart';
import '../../widgets/base_text_input.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthRequestResetPasswordLoading) {
            EasyLoading.show(status: 'Loading');
          }

          if (state is AuthRequestResetPasswordFailure) {
            EasyLoading.showInfo('Terjadi kesalahan');
          }

          if (state is AuthRequestResetPasswordSuccess) {
            EasyLoading.showSuccess('Tautan telah dikirim ke email');
            Navigator.pop(context);
          }
        },
        child: SafeArea(
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.GAP_SIZE_DEFAULT),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimensions.GAP_SIZE_DEFAULT),
                child: SvgPicture.asset(
                  'assets/images/forgot.svg',
                  width: 320,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimensions.GAP_SIZE_DEFAULT),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Lupa Password',
                      style: TextStyles.TEXT_HEADING,
                    ),
                    const SizedBox(height: Dimensions.GAP_SIZE_SMALL),
                    const Text(
                      'Masukan alamat email anda dan kami akan memberikan tautan untuk membuatkan kata sandi baru',
                      style: TextStyles.TEXT_SUBHEADING,
                    ),
                    const SizedBox(height: Dimensions.GAP_SIZE_LARGE),
                    BaseTextInput(
                      controller: emailController,
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: Dimensions.GAP_SIZE_LARGE),
                    BaseButton(
                      onPressed: () => context
                          .read<AuthBloc>()
                          .add(RequestResetPassword(emailController.text)),
                      textButton: 'Kirim',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
