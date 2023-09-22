import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/home/presentation/views/all_tasks_view.dart';
import 'package:tasks_app/features/home/presentation/views/users_view.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppConstants.defaultPadding,
          right: AppConstants.defaultPadding,
          top: AppConstants.defaultPadding,
        ),
        child: const Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 30,
              child: TabBar(
                  indicatorColor: AppColors.deepPurple,
                  labelColor: AppColors.deepPurple,
                  unselectedLabelColor: AppColors.grey500,
                  physics: BouncingScrollPhysics(),
                  tabs: [
                    Text('Users'),
                    Text('Tasks'),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  UsersView(),
                  AllTasksView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
