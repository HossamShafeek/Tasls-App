import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppConstants {
  static late final String token;
  static const String path = 'assets/images';
  static final double defaultPadding = 12.h;
  static final padding15h = 15.h;
  static final double padding10h = 10.h;
  static final double padding8h = 8.h;
  static final double padding5h = 5.h;
  static final double padding3h = 3.h;
  static final double radius15w = 15.w;
  static final double radius8w = 8.w;
  static final double radius10w = 10.w;

  static final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius8w),
    borderSide: BorderSide(
      width: 1.1.w,
      color: AppColors.deepPurple,
    ),
  );

  static final OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius8w),
    borderSide: BorderSide.none,
  );

  static const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: AppColors.transparent,
  );
}
