// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertest/app/core/utils/app_colors.dart';
import 'package:fluttertest/app/core/utils/dimensions.dart';

class TextStyles {
  static const TEXT_HEADING = TextStyle(
    color: AppColors.BLACK,
    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
    fontWeight: FontWeight.w600,
  );

  static const TEXT_SUBHEADING = TextStyle(
    color: AppColors.GREY,
    fontSize: Dimensions.FONT_SIZE_LARGE,
  );

  static const TEXT_DEFAULT = TextStyle(
    color: AppColors.BLACK,
    fontSize: Dimensions.FONT_SIZE_DEFAULT,
  );

  static const TEXT_SMALL = TextStyle(
    color: AppColors.BLACK,
    fontSize: Dimensions.FONT_SIZE_SMALL,
  );
}
