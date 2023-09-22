import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/config/themes/app_theme.dart';
import 'package:tasks_app/core/api/api_services_implementation.dart';
import 'package:tasks_app/features/Auth/data/repository/login_repository_implementation.dart';
import 'package:tasks_app/features/Auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:tasks_app/features/Auth/presentation/views/login_view.dart';
import 'package:tasks_app/features/department/data/repository/department_repository_implementation.dart';
import 'package:tasks_app/features/department/presentation/cubits/create_department_cubit/create_department_cubit.dart';
import 'package:tasks_app/features/department/presentation/cubits/get_departments_cubit/get_all_departments_cubit.dart';
import 'package:tasks_app/features/department/presentation/cubits/update_department_cubit/update_department_cubit.dart';
import 'package:tasks_app/features/home/data/repository/home_repository_implementation.dart';
import 'package:tasks_app/features/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/create_task_cubit/create_task_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/update_task_cubit/update_task_cubit.dart';
import 'package:tasks_app/features/user/data/repository/user_repository_implementation.dart';
import 'package:tasks_app/features/user/presentation/cubits/create_user_cubit/cretae_user_cubit.dart';
import 'package:tasks_app/features/user/presentation/cubits/delete_usre_cubit/delete_user_cubit.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_employees/gett_all_employees_cubit.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_managers_cubit/get_all_managers_cubit.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_users_cubit/gett_all_user_cubit.dart';
import 'package:tasks_app/features/user/presentation/cubits/update_user_cubit/update_user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const TasksApp());
}

class TasksApp extends StatelessWidget {
  const TasksApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AnimatedDrawerCubit(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(
                  LoginRepositoryImplementation(ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => CreateDepartmentCubit(
                  DepartmentRepositoryImplementation(
                      ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => UpdateDepartmentCubit(
                  DepartmentRepositoryImplementation(
                      ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => GetAllDepartmentsCubit(
                  DepartmentRepositoryImplementation(
                      ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => CreateUserCubit(
                  UserRepositoryImplementation(ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => GetAllUsersCubit(
                  UserRepositoryImplementation(ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => UpdateUserCubit(
                  UserRepositoryImplementation(ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => DeleteUserCubit(
                  UserRepositoryImplementation(ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => CreateTaskCubit(
                  HomeRepositoryImplementation(ApiServicesImplementation())),
            ), BlocProvider(
              create: (context) => GetAllTasksCubit(
                  HomeRepositoryImplementation(ApiServicesImplementation())),
            ), BlocProvider(
              create: (context) => UpdateTaskCubit(
                  HomeRepositoryImplementation(ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => GetAllEmployeesCubit(
                  UserRepositoryImplementation(ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => GetAllManagersCubit(
                  UserRepositoryImplementation(ApiServicesImplementation())),
            ),
          ],
          child: MaterialApp(
            title: 'Tasks',
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            home: const LoginView(),
          ),
        );
      },
    );
  }
}
