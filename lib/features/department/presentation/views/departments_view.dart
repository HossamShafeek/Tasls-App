import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_back_button.dart';
import 'package:tasks_app/features/department/presentation/cubits/get_departments_cubit/get_all_departments_cubit.dart';
import 'package:tasks_app/features/department/presentation/views/widgets/departments_view_body.dart';

class DepartmentsView extends StatefulWidget {
  const DepartmentsView({Key? key}) : super(key: key);

  @override
  State<DepartmentsView> createState() => _DepartmentsViewState();
}

class _DepartmentsViewState extends State<DepartmentsView> {
  @override
  void initState() {
    GetAllDepartmentsCubit.get(context).getAllDepartment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.titleForDepartments),
      ),
      body: const DepartmentsViewBody(),
    );
  }
}
