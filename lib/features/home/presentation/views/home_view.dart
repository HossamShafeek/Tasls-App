import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/department/presentation/views/create_department_view.dart';
import 'package:tasks_app/features/department/presentation/views/departments_view.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:tasks_app/features/user/presentation/views/create_user_view.dart';
import 'package:tasks_app/features/user/presentation/views/users_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
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
                  title: const Text('Departments'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const DepartmentsView();
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
                ListTile(
                  title: const Text('Users'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const UsersView();
                      },
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
// Center(
// child: TextButton(
// onPressed: () {
// CacheHelper.removeData(key: 'token').then((value) {
// Navigator.pushReplacement(context, MaterialPageRoute(
// builder: (context) {
// return const LoginView();
// },
// ));
// });
// },
// child: const Text('Logout')),
// ),
