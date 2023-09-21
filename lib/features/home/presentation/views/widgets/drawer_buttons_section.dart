import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/features/department/presentation/views/create_department_view.dart';
import 'package:tasks_app/features/department/presentation/views/departments_view.dart';
import 'package:tasks_app/features/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:tasks_app/features/home/presentation/views/create_task_view.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/drawer_buttons_section_item.dart';
import 'package:tasks_app/features/user/presentation/views/create_user_view.dart';
import 'package:tasks_app/features/user/presentation/views/users_view.dart';

class DrawerButtonsSection extends StatelessWidget {
  const DrawerButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerButtonsSectionItem(
          title: 'Home',
          icon: IconBroken.Home,
          onTap: () {
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'Create Users',
          icon: IconBroken.Add_User,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const CreateUserView();
              },
            ));
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'View Users',
          icon: IconBroken.User1,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const UsersView();
              },
            ));
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'Create Department',
          icon: IconBroken.Paper_Plus,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const CreateDepartmentView();
              },
            ));
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'View Departments',
          icon: IconBroken.Paper,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const DepartmentsView();
              },
            ));
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'Create Task',
          icon: IconBroken.Document,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const CreateTaskView();
              },
            ));
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
      ],
    );
  }
}
