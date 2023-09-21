import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/core/widgets/custom_container_button.dart';
import 'package:tasks_app/features/department/data/models/departments_model/datum.dart';
import 'package:tasks_app/features/department/presentation/views/update_department_view.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/employee_list_view.dart';

class DepartmentListViewItem2 extends StatelessWidget {
  const DepartmentListViewItem2({
    Key? key,
    required this.departments,
  }) : super(key: key);

  final Datum departments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical:AppConstants.padding5h),
          child: Row(
            children: [
              Text(
                departments.name!,
                style: AppStyles.textStyle16.copyWith(
                    color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
              const  Spacer(),
              CustomContainerButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateDepartmentView(
                        departmentId: departments.id!,
                        managerId: departments.manager!.id!,
                        departmentName: departments.name!,
                      ),
                    ),
                  );
                },
                icon: IconBroken.Edit,
                padding: AppConstants.padding3h,
                color: AppColors.deepPurple,
                radius: AppConstants.padding5w,
                backgroundColor: AppColors.grey50,
                iconSize: AppConstants.iconSize22,
              ),
              SizedBox(width: AppConstants.padding15w,),
              CustomContainerButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateDepartmentView(
                        departmentId: departments.id!,
                        managerId: departments.manager!.id!,
                        departmentName: departments.name!,
                      ),
                    ),
                  );
                },
                icon: IconBroken.Delete,
                padding: AppConstants.padding3h,
                color: AppColors.redAccent,
                radius: AppConstants.padding5w,
                backgroundColor: AppColors.grey50,
                iconSize: AppConstants.iconSize22,
              ),
            ],
          ),
        ),
        EmployeesListView(employees: departments.employees!),
      ],
    );
  }
}
