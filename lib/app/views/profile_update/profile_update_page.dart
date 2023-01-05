import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertest/app/bloc/auth/auth_bloc.dart';
import 'package:fluttertest/app/core/utils/dimensions.dart';
import 'package:fluttertest/app/views/widgets/base_button.dart';
import 'package:fluttertest/app/views/widgets/base_text_input.dart';

import '../../models/profile_model.dart';

class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final namaController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
      ),
      body: BlocSelector<AuthBloc, AuthState, dynamic>(
        selector: (state) {
          if (state is AuthProfileFetched) {
            namaController.text = state.profile.name;
            phoneController.text = state.profile.phone;
          }

          if (state is AuthProfileUpdated) {
            EasyLoading.showSuccess('Profile berhasil di update');
            Navigator.pop(context);
            context.read<AuthBloc>().add(GetProfile());
          }
        },
        builder: ((context, state) {
          return Form(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.GAP_SIZE_DEFAULT),
              child: Column(
                children: [
                  BaseTextInput(
                    controller: namaController,
                    labelText: 'Nama',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama harus diisi';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: Dimensions.GAP_SIZE_EXTRA_LARGE),
                  BaseTextInput(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    labelText: 'No. Telp',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'No. Telp harus diisi';
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(Dimensions.GAP_SIZE_DEFAULT),
        child: BaseButton(
          onPressed: () => context.read<AuthBloc>().add(UpdateProfile(
                namaController.text,
                phoneController.text,
              )),
          textButton: 'Update',
        ),
      ),
    );
  }
}
