import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/employees_list_view_item_body.dart';
import 'package:tasks_app/core/widgets/employees_list_view_item_head.dart';
import 'package:tasks_app/features/department/data/models/departments_model/employee.dart';
import 'package:tasks_app/features/user/presentation/views/update_user_view.dart';

class EmployeesListViewItem extends StatelessWidget {
  const EmployeesListViewItem({Key? key, required this.employee})
      : super(key: key);

  final Employee employee;

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
            title: employee.userType!,
            editOnTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return UpdateUserView(
                    id: employee.id!,
                    name: employee.name!,
                    email: employee.email!,
                    phone: employee.phone!,
                    userType: employee.userType!,
                  );
                },
              ));
            },
            deleteOnTap: () {},
          ),
          Expanded(
            child: Image.asset(
              AppStrings.userImage,
              fit: BoxFit.fill,
            ),
          ),
          ListViewItemBody(
            firstTitle: employee.name!,
            secondTitle: employee.email!,
            thirdTitle: employee.phone.toString(),
            secondTitleIcon: IconBroken.Message,
            thirdTitleIcon: IconBroken.Call,
          ),
        ],
      ),
    );
  }
}
