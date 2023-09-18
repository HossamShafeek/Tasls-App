import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.rightWidget}) : super(key: key);

  final Widget rightWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            IconBroken.Filter,
            size: AppConstants.iconSize24,
          ),),
        SizedBox(
          width: AppConstants.padding5h,
        ),
        Column(
          children: [
            Text(
              'Today',
              style:
              AppStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              '18/9/2023',
              style: AppStyles.textStyle14,
            ),
          ],
        ),
        const Spacer(),
         Padding(
           padding:  EdgeInsets.only(right: AppConstants.defaultPadding),
           child: rightWidget,
         ),
      ],
    );
  }
}