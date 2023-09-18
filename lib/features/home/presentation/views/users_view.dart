import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_cubit.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_state.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/department_list_view_item.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  void initState() {
    DepartmentCubit.get(context).getAllDepartment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentCubit, DepartmentState>(
      builder: (context, state) {
        if (state is GetAllDepartmentsSuccessState) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.departmentModel.data!.length,
            itemBuilder: (context, index) {
              return DepartmentListViewItem2(
                departmentsModel: state.departmentModel,
                index: index,
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
