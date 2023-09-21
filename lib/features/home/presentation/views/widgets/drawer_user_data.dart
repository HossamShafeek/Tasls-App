import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/core/widgets/user_photp_widget.dart';
import 'package:tasks_app/features/Auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:tasks_app/features/Auth/presentation/cubit/login_cubit/login_state.dart';

class DrawerUserData extends StatelessWidget {
  const DrawerUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Row(
          children: [
            const UserPhotoWidget(),
            SizedBox(width: AppConstants.padding10w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LoginCubit.get(context).loginModel!.data!.username!,
                  maxLines: 1,
                  style: AppStyles.textStyle16.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  LoginCubit.get(context).loginModel!.data!.email!,
                  style: AppStyles.textStyle12,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
