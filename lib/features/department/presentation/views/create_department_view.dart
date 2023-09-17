import 'package:flutter/material.dart';
import 'package:tasks_app/features/department/presentation/views/widgets/create_department_view_body.dart';

class CreateDepartmentView extends StatelessWidget {
  const CreateDepartmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CreateDepartmentViewBody(),
    );
  }
}

