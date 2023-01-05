import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/text_styles.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthProfileError) {
          if (state.error.contains('Unauthorized')) {
            EasyLoading.showInfo('Expired Token');
            context.read<AuthBloc>().add(Logout());
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            );
          }
        }
      },
      builder: (context, state) {
        if (state is AuthProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is AuthProfileError) {
          return Text(state.error);
        }

        if (state is AuthProfileFetched) {
          return Padding(
            padding: const EdgeInsets.all(Dimensions.GAP_SIZE_DEFAULT),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            CupertinoIcons.person,
                            color: AppColors.LIGHT_BLUE,
                          ),
                        ),
                        const SizedBox(width: Dimensions.GAP_SIZE_SMALL),
                        Text(
                          state.profile.name,
                          style: TextStyles.TEXT_SUBHEADING.copyWith(
                            color: AppColors.BLACK,
                          ),
                        ),
                      ],
                    ),
                    Theme(
                      data: ThemeData(splashFactory: NoSplash.splashFactory),
                      child: IconButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          '/profile-update',
                          arguments: state.profile,
                        ),
                        icon: const Icon(
                          CupertinoIcons.pencil_circle_fill,
                          color: AppColors.LIGHT_BLUE,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.GAP_SIZE_SMALL),
                const Padding(
                  padding: EdgeInsets.all(Dimensions.GAP_SIZE_SMALL),
                  child: Text(
                    'Informasi',
                    style: TextStyles.TEXT_HEADING,
                  ),
                ),
                const Divider(),
                boxInformation('Nama lengkap', state.profile.name),
                boxInformation('Email', state.profile.email),
                boxInformation('No. Telp', state.profile.phone),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget boxInformation(String heading, String subHeading) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.GAP_SIZE_SMALL,
        horizontal: Dimensions.GAP_SIZE_SMALL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading),
          const SizedBox(height: Dimensions.GAP_SIZE_EXTRA_SMALL),
          Text(
            subHeading,
            style: TextStyles.TEXT_SUBHEADING.copyWith(
              color: AppColors.BLACK,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
