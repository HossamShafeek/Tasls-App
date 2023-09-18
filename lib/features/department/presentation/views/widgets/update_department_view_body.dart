import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_text_field.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_cubit.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_state.dart';

class UpdateDepartmentViewBody extends StatelessWidget {
  const UpdateDepartmentViewBody({
    Key? key,
    required this.departmentId,
    required this.managerId, required this.departmentName,
  }) : super(key: key);

  final int departmentId;
  final String departmentName;
  final int managerId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentCubit, DepartmentState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleAndSubtitle(
                title: ' Update Department!',
                subtitle:
                    'Update  department details and assign a new manager to continue work!',
              ),
              CustomTextField(
                controller:
                    DepartmentCubit.get(context).nameControllerForUpdate,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter department name';
                  }
                  return null;
                },
                title: 'Name',
                hintText: 'Enter department name',
              ),
              GradientButton(
                onPressed: () {
                  DepartmentCubit.get(context).updateDepartment(
                    name: departmentName,
                    departmentId: departmentId,
                    managerId: managerId.toString(),
                  );
                },
                title: AppStrings.update,
              )
            ],
          ),
        );
      },
    );
  }
}
