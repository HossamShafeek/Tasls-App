import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/features/home/presentation/cubits/task_cubit/task_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/task_cubit/task_state.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_employees/get_all_employees_state.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_employees/gett_all_employees_cubit.dart';

class CustomDropDownWidget extends StatefulWidget {
  const CustomDropDownWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  @override
  void initState() {
    GetAllEmployeesCubit.get(context).getAllEmployees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return BlocBuilder<GetAllEmployeesCubit, GetAllEmployeesState>(
          builder: (context, state) {
            if (state is GetAllEmployeesSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Employee',
                    style: AppStyles.textStyle16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppConstants.defaultPadding,
                      bottom: AppConstants.padding15h,
                    ),
                    child: DropdownButtonFormField(
                      validator: (value) =>
                          value == null ? 'Please assigned employee' : null,
                      decoration: InputDecoration(
                        fillColor: AppColors.grey50,
                        filled: true,
                        isDense: true,
                        hintStyle: AppStyles.textStyle14.copyWith(
                          color: AppColors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        border: AppConstants.enabledBorder,
                        focusedBorder: AppConstants.enabledBorder,
                      ),
                      isExpanded: true,
                      borderRadius:
                          BorderRadius.circular(AppConstants.radius8w),
                      hint: Text(
                        'Assigned Employee',
                        style: AppStyles.textStyle14,
                      ),
                      items: state.employeesModel.data!
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name!),
                              ))
                          .toList(),
                      onChanged: (value) {
                        TaskCubit.get(context)
                            .changeDropdownValue(value: value);
                      },
                    ),
                  ),
                ],
              );
            } else if (state is GetAllEmployeesFailureState) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
