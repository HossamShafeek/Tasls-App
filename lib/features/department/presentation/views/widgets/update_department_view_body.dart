import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/functions/show_snack_bar.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_text_field.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/department/presentation/cubits/update_department_cubit/update_department_cubit.dart';
import 'package:tasks_app/features/department/presentation/cubits/update_department_cubit/update_department_state.dart';
import 'package:tasks_app/features/department/presentation/views/widgets/managers_dropdown.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_managers_cubit/get_all_managers_cubit.dart';

class UpdateDepartmentViewBody extends StatelessWidget {
  const UpdateDepartmentViewBody({
    Key? key,
    required this.departmentId,
    required this.managerId,
    required this.departmentName,
  }) : super(key: key);

  final int departmentId;
  final String departmentName;
  final int managerId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateDepartmentCubit, UpdateDepartmentState>(
      listener: (context, state) {
        if (state is UpdateDepartmentFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }else if(state is UpdateDepartmentSuccessState){
          showSuccessSnackBar(context: context, message: state.updateDepartmentModel.message!);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              state is UpdateDepartmentLoadingState? const LinearProgressIndicator():const SizedBox(),
              const TitleAndSubtitle(
                subtitle: AppStrings.subtitleForUpdateDepartment,
              ),
              CustomTextField(
                controller:
                    UpdateDepartmentCubit.get(context).nameControllerForUpdate,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter department name';
                  }
                  return null;
                },
                title: 'Name',
                hintText: 'Enter department name',
              ),
              const ManagersDropdown(),
              GradientButton(
                onPressed: () {
                  UpdateDepartmentCubit.get(context).updateDepartment(
                    name: departmentName,
                    departmentId: departmentId,
                    managerId: GetAllManagersCubit.get(context)
                        .dropdownValue
                        .toString(),
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
