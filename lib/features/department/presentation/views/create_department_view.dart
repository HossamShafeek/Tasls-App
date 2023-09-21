import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_back_button.dart';
import 'package:tasks_app/features/department/presentation/views/widgets/create_department_view_body.dart';

class CreateDepartmentView extends StatelessWidget {
  const CreateDepartmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.titleForCreateDepartment),
      ),
      body: const CreateDepartmentViewBody(),
    );
  }
}
