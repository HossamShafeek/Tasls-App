import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/config/themes/app_theme.dart';
import 'package:tasks_app/core/api/api_services_implementation.dart';
import 'package:tasks_app/features/Auth/presentation/views/login_view.dart';
import 'package:tasks_app/features/department/data/repository/department_repository_implementation.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_cubit.dart';
import 'package:tasks_app/features/user/data/repository/user_repository_implementation.dart';
import 'package:tasks_app/features/user/presentation/cubits/create_user_cubit/cretae_user_cubit.dart';
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
              create: (context) => DepartmentCubit(
                  DepartmentRepositoryImplementation(
                      ApiServicesImplementation())),
            ),
            BlocProvider(
              create: (context) => UserCubit(
                  UserRepositoryImplementation(ApiServicesImplementation())),
            ),BlocProvider(
              create: (context) => GetAllUsersCubit(
                  UserRepositoryImplementation(ApiServicesImplementation())),
            ),BlocProvider(
              create: (context) => UpdateUserCubit(
                  UserRepositoryImplementation(ApiServicesImplementation())),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            home: const LoginView(),
          ),
        );
      },
    );
  }
}
