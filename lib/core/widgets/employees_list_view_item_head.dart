import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/core/widgets/custom_container_button.dart';

class ListViewItemHead extends StatelessWidget {
  const ListViewItemHead({
    Key? key,
    required this.editOnTap,
    required this.deleteOnTap,
    required this.title,
  }) : super(key: key);
  final void Function() editOnTap;
  final void Function() deleteOnTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomContainerButton(
          onTap: editOnTap,
          icon: IconBroken.Edit,
          padding: AppConstants.padding3h,
          color: AppColors.deepPurple,
          radius: AppConstants.radius5w,
          backgroundColor: AppColors.white,
          iconSize: AppConstants.iconSize22,
        ),
        Text(
          title,
          style: AppStyles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        CustomContainerButton(
          onTap: deleteOnTap,
          icon: IconBroken.Delete,
          padding: AppConstants.padding3h,
          color: AppColors.redAccent,
          radius: AppConstants.radius5w,
          backgroundColor: AppColors.white,
          iconSize: AppConstants.iconSize22,
        ),
      ],
    );
  }
}
