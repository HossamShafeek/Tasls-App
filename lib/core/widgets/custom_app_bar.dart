import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/features/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/animated_drawer_cubit/animated_drawer_state.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.rightWidget}) : super(key: key);

  final Widget rightWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<AnimatedDrawerCubit, AnimatedDrawerState>(
          builder: (context, state) {
            return IconButton(
              icon: AnimatedDrawerCubit.get(context).isOpenDrawer
                  ? const Icon(
                      IconBroken.Arrow___Left_2,
                      size: 35,
                      color: AppColors.deepPurple,
                    )
                  : const Icon(
                      IconBroken.Filter,
                      size: 30,
                      color: AppColors.deepPurple,
                    ),
              onPressed: () {
                AnimatedDrawerCubit.get(context).isOpenDrawer
                    ? AnimatedDrawerCubit.get(context).closeDrawer()
                    : AnimatedDrawerCubit.get(context).openDrawer();
              },
            );
          },
        ),
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
          padding: EdgeInsets.only(right: AppConstants.defaultPadding),
          child: rightWidget,
        ),
      ],
    );
  }
}
