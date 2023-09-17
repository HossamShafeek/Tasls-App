import 'package:flutter/material.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/Auth/presentation/views/login_view.dart';
import 'package:tasks_app/features/department/presentation/views/create_department_view.dart';
import 'package:tasks_app/features/user/presentation/views/cretae_user_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppConstants.padding15h),
          child: Column(
            children: [
              ListTile(
                title: const Text('Create Department'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const CreateDepartmentView();
                    },
                  ));
                },
              ),
              ListTile(
                title: const Text('Create User'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const CreateUserView();
                    },
                  ));
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.deepPurple,
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              CacheHelper.removeData(key: 'token').then((value) {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginView();
                  },
                ));
              });
            },
            child: const Text('Logout')),
      ),
    );
  }
}
