import 'package:flutter/material.dart';
import 'package:tasks_app/core/widgets/custom_app_bar.dart';
import 'package:tasks_app/features/home/presentation/views/home_view_for_user.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/add_user_and_task.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/tab_bar_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeViewForUser(),
                  ));
            },
            child: const CustomAppBar(
              rightWidget: AddUserAndTask(),
            ),
          ),
          const TabBarWidget(),
        ],
      ),
    );
  }
}
