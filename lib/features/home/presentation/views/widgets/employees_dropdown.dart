import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_dropdown.dart';
import 'package:tasks_app/features/home/presentation/cubits/create_task_cubit/create_task_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/create_task_cubit/create_task_state.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_employees/get_all_employees_state.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_employees/gett_all_employees_cubit.dart';

class EmployeesDropdown extends StatefulWidget {
  const EmployeesDropdown({
    Key? key,
  }) : super(key: key);

  @override
  State<EmployeesDropdown> createState() => _EmployeesDropdownState();
}

class _EmployeesDropdownState extends State<EmployeesDropdown> {
  @override
  void initState() {
    GetAllEmployeesCubit.get(context).getAllEmployees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTaskCubit, CreateTaskState>(
      builder: (context, state) {
        return BlocBuilder<GetAllEmployeesCubit, GetAllEmployeesState>(
          builder: (context, state) {
            if (state is GetAllEmployeesSuccessState) {
              return CustomDropdown(
                title: AppStrings.employee,
                hintText: 'Assigned employee',
                messageForValidate: 'Please assigned employee',
                items: state.employeesModel.data!
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name!),
                      ),
                    )
                    .toList(),
                onChange: (value) {
                  CreateTaskCubit.get(context).dropdownValue =
                      value.id.toString();
                  print(value.id.toString());
                },
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
