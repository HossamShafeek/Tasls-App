import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/employees_list_view_item_body.dart';
import 'package:tasks_app/core/widgets/employees_list_view_item_head.dart';
import 'package:tasks_app/features/department/data/models/departments_model/datum.dart';
import 'package:tasks_app/features/department/presentation/views/update_department_view.dart';

class DepartmentsGridViewItem extends StatelessWidget {
  const DepartmentsGridViewItem({Key? key, required this.departmentsModel})
      : super(key: key);
  final Datum departmentsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.padding8h),
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(AppConstants.radius10w),
      ),
      child: Column(
        children: [
          ListViewItemHead(
            title: departmentsModel.id.toString(),
            editOnTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return UpdateDepartmentView(
                    departmentName: departmentsModel.name!,
                    departmentId: departmentsModel.id!,
                    managerId: departmentsModel.manager!.id!,
                  );
                },
              ));
            },
            deleteOnTap: () {},
          ),
          Expanded(
            child: Image.asset(
              AppStrings.departmentImage,
              fit: BoxFit.fill,
            ),
          ),
          ListViewItemBody(
            firstTitle: departmentsModel.name!,
            secondTitle: departmentsModel.manager!.name!,
            secondTitleIcon: IconBroken.Profile,
            thirdTitle: departmentsModel.employees!.length.toString(),
            thirdTitleIcon: IconBroken.User1,
          ),
        ],
      ),
    );
  }
}
