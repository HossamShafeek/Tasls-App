import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';

class EmployeeGridViewItem extends StatelessWidget {
  const EmployeeGridViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppConstants.padding10w,
          decoration: BoxDecoration(
            color: AppColors.deepPurple,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                AppConstants.radius8w,
              ),
              topLeft: Radius.circular(
                AppConstants.radius8w,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(AppConstants.padding5h),
            decoration: BoxDecoration(
              color: AppColors.grey50,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(
                  AppConstants.radius8w,
                ),
                topRight: Radius.circular(
                  AppConstants.radius8w,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Employee',
                  style: AppStyles.textStyle16
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Admin',
                  style: AppStyles.textStyle14.copyWith(
                      color: AppColors.deepPurple, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(
                      IconBroken.Message,
                      size: AppConstants.iconSize18,
                      color: AppColors.deepPurple,
                    ),
                    SizedBox(
                      width: AppConstants.padding3w,
                    ),
                    Text(
                      'Email Address',
                      style: AppStyles.textStyle14,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      IconBroken.Call,
                      size: AppConstants.iconSize18,
                      color: AppColors.deepPurple,
                    ),
                    SizedBox(
                      width: AppConstants.padding3w,
                    ),
                    Text(
                      'Phone',
                      style: AppStyles.textStyle14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
