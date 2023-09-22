import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/department/presentation/cubits/get_departments_cubit/get_all_departments_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/animated_drawer_cubit/animated_drawer_state.dart';
import 'package:tasks_app/features/home/presentation/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    GetAllDepartmentsCubit.get(context).getAllDepartment();
    GetAllTasksCubit.get(context).getAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimatedDrawerCubit, AnimatedDrawerState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: AnimatedContainer(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.antiAlias,
            transform: Matrix4.translationValues(
                AnimatedDrawerCubit.get(context).xOffset,
                AnimatedDrawerCubit.get(context).yOffset,
                0)
              ..scale(AnimatedDrawerCubit.get(context).scaleFactor),
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  AnimatedDrawerCubit.get(context).isOpenDrawer ? 20.0 : 0.0),
            ),
            child: const HomeViewBody(),
          ),
        );
      },
    );
  }
}
