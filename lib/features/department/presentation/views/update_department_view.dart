import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_back_button.dart';
import 'package:tasks_app/features/department/presentation/cubits/update_department_cubit/update_department_cubit.dart';
import 'package:tasks_app/features/department/presentation/views/widgets/update_department_view_body.dart';

class UpdateDepartmentView extends StatefulWidget {
  const UpdateDepartmentView({
    Key? key,
    required this.departmentId,
    required this.managerId,
    required this.departmentName,
  }) : super(key: key);

  final int departmentId;
  final int managerId;
  final String departmentName;

  @override
  State<UpdateDepartmentView> createState() => _UpdateDepartmentViewState();
}

class _UpdateDepartmentViewState extends State<UpdateDepartmentView> {
  @override
  void initState() {
    UpdateDepartmentCubit.get(context).nameControllerForUpdate.text =
        widget.departmentName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.titleForUpdateDepartment),
      ),
      body: UpdateDepartmentViewBody(
        departmentId: widget.departmentId,
        managerId: widget.managerId,
        departmentName: widget.departmentName,
      ),
    );
  }
}

// Text(
//   'Manager',
//   style: AppStyles.textStyle16,
// ),

// Container(
//   margin: EdgeInsets.only(
//       top: AppConstants.defaultPadding,
//       bottom: AppConstants.padding15h),
//   padding: EdgeInsets.symmetric(horizontal: AppConstants.padding10w),
//   decoration: BoxDecoration(
//     color: AppColors.grey50,
//     borderRadius: BorderRadius.circular(AppConstants.radius8w),
//   ),
//   child: DropdownButton(
//     isExpanded: true,
//     borderRadius: BorderRadius.circular(AppConstants.radius8w),
//     underline: const SizedBox(),
//     hint: Text(
//       'Assigned Manager',
//       style: AppStyles.textStyle14,
//     ),
//     items: [
//       'hossam',
//       'ahmed',
//       'samy',
//     ]
//         .map((e) => DropdownMenuItem(
//               child: Text(e),
//               value: e,
//             ))
//         .toList(),
//     onChanged: (value) {},
//   ),
// ),
