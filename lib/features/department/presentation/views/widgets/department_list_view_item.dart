import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/features/department/data/models/departments_model/departments_model.dart';
import 'package:tasks_app/features/department/presentation/views/update_department_view.dart';

class DepartmentListViewItem extends StatelessWidget {
  const DepartmentListViewItem(
      {Key? key, required this.departmentsModel, required this.index})
      : super(key: key);
  final DepartmentsModel departmentsModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(departmentsModel.data![index].name!),
      subtitle: Text(departmentsModel.data![index].manager!.name!),
      trailing: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateDepartmentView(
                departmentName: departmentsModel.data![index].name!,
                departmentId: departmentsModel.data![index].id!,
                managerId: departmentsModel.data![index].manager!.id!,
              ),
            ),
          );
        },
        icon: const Icon(IconBroken.Edit),
      ),
    );
  }
}
