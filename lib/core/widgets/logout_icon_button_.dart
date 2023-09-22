import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/Auth/presentation/views/login_view.dart';
import 'package:tasks_app/features/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';

class LogoutIconButton extends StatelessWidget {
  const LogoutIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        CacheHelper.removeData(key: 'token').then((value) {
          AnimatedDrawerCubit.get(context).closeDrawer();
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const LoginView();
            },
          ));
        });
      },
      icon:  Icon(
        IconBroken.Logout,
        color: AppColors.deepPurple,
        size: AppConstants.iconSize33,
      ),
    );
  }
}