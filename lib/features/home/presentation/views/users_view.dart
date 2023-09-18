import 'package:flutter/material.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/department_list_view_item.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return  const DepartmentListViewItem2();
      },
    );
  }
}





