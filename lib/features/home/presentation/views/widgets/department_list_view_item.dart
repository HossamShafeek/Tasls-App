import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/employee_grid_view.dart';

class DepartmentListViewItem2 extends StatelessWidget {
  const DepartmentListViewItem2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
          children:  const[
            Text('Department Name'),
            Icon(IconBroken.Edit),
          ],
        ),
        const EmployeeGridView(),
      ],
    );
  }
}