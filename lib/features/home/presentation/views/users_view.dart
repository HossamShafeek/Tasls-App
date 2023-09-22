import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/functions/get_department_without_employee_equal_null.dart';
import 'package:tasks_app/features/department/presentation/cubits/get_departments_cubit/get_all_departments_cubit.dart';
import 'package:tasks_app/features/department/presentation/cubits/get_departments_cubit/get_all_departments_state.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/department_list_view_item.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDepartmentsCubit, GetAllDepartmentsState>(
      builder: (context, state) {
        if (state is GetAllDepartmentsSuccessState) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: getDepartmentWithoutEmployeeEqualNull(
                    departments: state.departmentModel.data!)
                .length,
            itemBuilder: (context, index) {
              return DepartmentListViewItem2(
                departments: getDepartmentWithoutEmployeeEqualNull(
                    departments: state.departmentModel.data!)[index],
              );
            },
          );
        } else if (state is GetAllDepartmentsFailureState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
