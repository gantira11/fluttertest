import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/dimensions.dart';
import '../../../core/utils/text_styles.dart';
import 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: Dimensions.GAP_SIZE_EXTRA_LARGE),
            Center(
              child: SvgPicture.asset(
                'assets/images/login.svg',
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
                    'Hi, Selamat datang kembali!',
                    style: TextStyles.TEXT_HEADING,
                  ),
                  SizedBox(height: Dimensions.GAP_SIZE_SMALL),
                  Text(
                    'Login untuk melanjutkan',
                    style: TextStyles.TEXT_DEFAULT,
                  )
                ],
              ),
            ),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
