import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/features/Auth/presentation/views/login_view.dart';
import 'package:tasks_app/features/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';

class DrawerLogoutButton extends StatelessWidget {
  const DrawerLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CacheHelper.removeData(key: 'token').then((value) {
          AnimatedDrawerCubit.get(context).closeDrawer();
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const LoginView();
            },
          ));
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            IconBroken.Logout,
            color: Colors.white,
            size: AppConstants.iconSize28,
          ),
          SizedBox(
            width: AppConstants.padding10w,
          ),
          Text(
            'Logout',
            style: AppStyles.textStyle15,
          ),
        ],
      ),
    );
  }
}
