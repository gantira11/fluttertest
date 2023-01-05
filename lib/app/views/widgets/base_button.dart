import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/text_styles.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.onPressed,
    required this.textButton,
  }) : super(key: key);

  final void Function()? onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.BLUE,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: TextStyles.TEXT_SUBHEADING.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
