import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/config/themes/app_theme.dart';
import 'package:tasks_app/features/Auth/presentation/views/login_view.dart';

void main() async{
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          home: const LoginView(),
        );
      },
    );
  }
}
