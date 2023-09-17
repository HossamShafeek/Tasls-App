import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_cubit.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_state.dart';

class DepartmentsView extends StatefulWidget {
  const DepartmentsView({Key? key}) : super(key: key);

  @override
  State<DepartmentsView> createState() => _DepartmentsViewState();
}

class _DepartmentsViewState extends State<DepartmentsView> {
  @override
  void initState() {
    DepartmentCubit.get(context).getAllDepartment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const DepartmentsViewBody(),
    );
  }
}

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
              return ListTile(
                title: Text(state.departmentModel.data![index].name!),
                subtitle: Text(state.departmentModel.data![index].manager!.name!),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(IconBroken.Edit),
                ),
              );
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
