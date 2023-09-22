import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/widgets/custom_app_bar.dart';
import 'package:tasks_app/core/widgets/date_picker_widget.dart';
import 'package:tasks_app/features/home/presentation/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/circular_progress_grop.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/usre_tasks_list_view.dart';

class HomeViewForUser extends StatefulWidget {
  const HomeViewForUser({Key? key}) : super(key: key);

  @override
  State<HomeViewForUser> createState() => _HomeViewForUserState();
}

class _HomeViewForUserState extends State<HomeViewForUser> {
  @override
  void initState() {
    GetAllTasksCubit.get(context).getAllTasks();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: AppConstants.padding5h,
            ),
            const CustomAppBar(rightWidget: CircularProgressGroup()),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:AppConstants.defaultPadding),
                child: const Column(
                  children: [
                    DatePickerWidget(),
                    UserTasksListView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
