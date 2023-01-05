import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertest/app/core/utils/app_colors.dart';

import '../../../../bloc/auth/auth_bloc.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../widgets/base_button.dart';
import '../../../widgets/base_text_input.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  bool obscurePassword = true;
  bool obscurePassowrdConfirmation = true;

  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthRegisterLoading) {
          EasyLoading.show(status: 'Loading');
        }

        if (state is AuthRegisterSuccess) {
          Navigator.pop(context);
          EasyLoading.showSuccess('Register Berhasil');
        }

        if (state is AuthRegisterFailure) {
          EasyLoading.showInfo('Terjadi kesalahan');
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.GAP_SIZE_DEFAULT),
          child: Column(
            children: [
              BaseTextInput(
                controller: namaController,
                labelText: 'Nama',
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Nama harus diisi';

                  return null;
                },
              ),
              const SizedBox(height: Dimensions.GAP_SIZE_LARGE),
              BaseTextInput(
                controller: emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email harus diisi';
                  }

                  return null;
                },
              ),
              const SizedBox(height: Dimensions.GAP_SIZE_LARGE),
              BaseTextInput(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                labelText: 'No.Telp',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No.Telp harus diisi';
                  }

                  return null;
                },
              ),
              const SizedBox(height: Dimensions.GAP_SIZE_LARGE),
              BaseTextInput(
                controller: passwordController,
                labelText: 'Password',
                obscureText: obscurePassword,
                suffixIcon: GestureDetector(
                  onTap: () => setState(() {
                    obscurePassword = !obscurePassword;
                  }),
                  child: Icon(
                    obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.GREY,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password harus diisi';
                  }

                  return null;
                },
              ),
              const SizedBox(height: Dimensions.GAP_SIZE_LARGE),
              BaseTextInput(
                controller: passwordConfirmationController,
                labelText: 'Konfirmasi Password',
                obscureText: obscurePassowrdConfirmation,
                suffixIcon: GestureDetector(
                  onTap: () => setState(() {
                    obscurePassowrdConfirmation = !obscurePassowrdConfirmation;
                  }),
                  child: Icon(
                    obscurePassowrdConfirmation
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.GREY,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password harus diisi';
                  }

                  if (value != passwordController.text) {
                    return 'Password tidak valid';
                  }

                  return null;
                },
              ),
              const SizedBox(height: Dimensions.GAP_SIZE_LARGE),
              BaseButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(Register(
                          namaController.text,
                          emailController.text,
                          phoneController.text,
                          passwordController.text,
                          passwordConfirmationController.text,
                        ));
                  }
                },
                textButton: 'Register',
              )
            ],
          ),
        ),
      ),
    );
  }
}
