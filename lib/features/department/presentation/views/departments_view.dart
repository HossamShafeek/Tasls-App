import 'package:flutter/material.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_cubit.dart';
import 'package:tasks_app/features/department/presentation/views/widgets/departments_view_body.dart';

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
