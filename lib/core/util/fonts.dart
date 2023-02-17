import 'package:coordinadora_test/core/util/apcolors.dart';
import 'package:coordinadora_test/core/util/screen_size.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  final BuildContext context;

  AppTextStyle(this.context);

  TextStyle get title {
    return _baseTextStyle.copyWith(
      fontSize: ScreenSize.height(context) * 0.024, // 20
      fontWeight: FontWeight.w700,
      color: APColors.primaryMain,
    );
  }

  /// BASE
  static const _baseTextStyle = TextStyle(
    color: APColors.primaryMain,
    fontWeight: FontWeight.normal,
  );
}
