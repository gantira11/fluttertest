import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertest/app/views/auth/register/widgets/register_form.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/text_styles.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: Dimensions.GAP_SIZE_EXTRA_LARGE),
            Center(
              child: SvgPicture.asset(
                'assets/images/register.svg',
                height: 240,
              ),
            ),
            const SizedBox(height: Dimensions.GAP_SIZE_LARGE),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.GAP_SIZE_DEFAULT,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Daftar Akun',
                    style: TextStyles.TEXT_HEADING,
                  ),
                  SizedBox(height: Dimensions.GAP_SIZE_SMALL),
                  Text(
                    'Register untuk melanjutkan',
                    style: TextStyles.TEXT_DEFAULT,
                  )
                ],
              ),
            ),
            // const LoginForm(),
            const RegisterForm(),
            Padding(
              padding: const EdgeInsets.all(Dimensions.GAP_SIZE_DEFAULT),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Sudah memiliki akun? ',
                    style: TextStyles.TEXT_SMALL,
                    children: [
                      TextSpan(
                        text: 'Login disini!',
                        style: TextStyles.TEXT_SMALL.copyWith(
                          color: AppColors.BLUE,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
