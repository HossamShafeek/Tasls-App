import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/features/department/data/models/departments_model/departments_model.dart';
import 'package:tasks_app/features/department/presentation/views/update_department_view.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/employee_grid_view.dart';

class DepartmentListViewItem2 extends StatelessWidget {
  const DepartmentListViewItem2(
      {Key? key, required this.departmentsModel, required this.index})
      : super(key: key);

  final DepartmentsModel departmentsModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              departmentsModel.data![index].name!,
              style: AppStyles.textStyle16,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateDepartmentView(
                        departmentId: departmentsModel.data![index].id!,
                        managerId: departmentsModel.data![index].manager!.id!,
                        departmentName: departmentsModel.data![index].name!,
                      ),
                    ),
                  );
                },
                child: Icon(
                  IconBroken.Edit,
                  size: AppConstants.iconSize24,
                )),
          ],
        ),
        const EmployeeGridView(),
      ],
    );
  }
}
