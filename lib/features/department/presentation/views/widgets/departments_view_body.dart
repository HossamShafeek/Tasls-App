import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_cubit.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_state.dart';
import 'package:tasks_app/features/department/presentation/views/widgets/department_list_view_item.dart';

class DepartmentsViewBody extends StatelessWidget {
  const DepartmentsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentCubit, DepartmentState>(
      builder: (context, state) {
        if (state is GetAllDepartmentsSuccessState) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: state.departmentModel.data!.length,
            itemBuilder: (context, index) {
              return DepartmentListViewItem(
                  departmentsModel: state.departmentModel, index: index);
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          );
        } else if (state is GetAllDepartmentsFailureState) {
          return Center(
            child: Text(state.error, textAlign: TextAlign.center),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
