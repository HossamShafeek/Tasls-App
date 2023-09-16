import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.title,
    this.suffixIcon,
    required this.hintText,
    this.maxLength,
    this.textInputType,
    this.obscureText = false,
    this.prefixIcon,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget title;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final int? maxLength;
  final TextInputType? textInputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title,
        Padding(
          padding: EdgeInsets.only(
            top: AppConstants.defaultPadding,
            bottom: 15.h,
          ),
          child: TextFormField(
            controller: controller,
            //cursorColor: AppColors.blue,
            keyboardType: textInputType,
            maxLength: maxLength,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              filled: true,
              isDense: true,
              hintStyle: AppStyles.textStyle14.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.normal,
              ),
              fillColor: AppColors.grey50,
              border: AppConstants.enabledBorder,
              focusedBorder: AppConstants.focusedBorder,
            ),
          ),
        ),
      ],
    );
  }
}
