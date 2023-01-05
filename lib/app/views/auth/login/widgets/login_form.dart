import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertest/app/bloc/auth/auth_bloc.dart';
import 'package:fluttertest/app/core/utils/app_colors.dart';
import 'package:fluttertest/app/core/utils/text_styles.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../widgets/base_button.dart';
import '../../../widgets/base_text_input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  bool obscure = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginLoading) {
          EasyLoading.show(status: 'Loading');
        }

        if (state is AuthLoginSuccess) {
          if (state.response['user']['email_verified_at'] == null) {
            emailController.clear();
            passwordController.clear();

            context.read<AuthBloc>().add(RequestVerificationEmail());
            Navigator.pushNamed(context, '/verify-email');

            EasyLoading.dismiss();
          } else {
            emailController.clear();
            passwordController.clear();
            Navigator.pushReplacementNamed(context, '/home');

            EasyLoading.dismiss();
          }
        }

        if (state is AuthLoginFailure) {
          EasyLoading.showInfo('Username atau password salah');
        }
      },
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.GAP_SIZE_DEFAULT),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                controller: passwordController,
                labelText: 'Password',
                obscureText: obscure,
                suffixIcon: GestureDetector(
                  onTap: () => setState(() {
                    obscure = !obscure;
                  }),
                  child: Icon(
                    obscure ? Icons.visibility : Icons.visibility_off,
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
              const SizedBox(height: Dimensions.GAP_SIZE_DEFAULT),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/forgot-password');
                  emailController.clear();
                  passwordController.clear();
                },
                child: Text(
                  '  Lupa Password?',
                  style: TextStyles.TEXT_DEFAULT.copyWith(
                    color: AppColors.BLUE,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.GAP_SIZE_LARGE),
              BaseButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(Login(
                          emailController.text,
                          passwordController.text,
                        ));
                  }
                },
                textButton: 'Login',
              ),
              const SizedBox(height: Dimensions.GAP_SIZE_DEFAULT),
              Padding(
                padding: const EdgeInsets.all(Dimensions.GAP_SIZE_DEFAULT),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Belum memiliki akun? ',
                      style: TextStyles.TEXT_SMALL,
                      children: [
                        TextSpan(
                          text: 'Register disini!',
                          style: TextStyles.TEXT_SMALL.copyWith(
                            color: AppColors.BLUE,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  formKey.currentState!.reset(),
                                  emailController.clear(),
                                  passwordController.clear(),
                                  Navigator.pushNamed(
                                    context,
                                    '/register',
                                  ),
                                },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
