import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/text_styles.dart';
import '../widgets/base_button.dart';
import 'widgets/profile_information.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(GetProfile());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                Dimensions.GAP_SIZE_DEFAULT,
              ),
              child: Text(
                'Profile',
                style: TextStyles.TEXT_HEADING.copyWith(
                  fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                ),
              ),
            ),
            const ProfileInformation()
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(Dimensions.GAP_SIZE_DEFAULT),
        child: BaseButton(
          onPressed: () {
            context.read<AuthBloc>().add(Logout());
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
          textButton: 'Logout',
        ),
      ),
    );
  }
}
