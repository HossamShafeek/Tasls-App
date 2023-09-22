import 'package:tasks_app/features/department/data/models/create_department_model/department_model.dart';

abstract class CreateDepartmentState {}

class CreateDepartmentInitialState extends CreateDepartmentState {}

class CreateDepartmentLoadingState extends CreateDepartmentState {}

class CreateDepartmentSuccessState extends CreateDepartmentState {
  final CreateDepartmentModel departmentModel;

  CreateDepartmentSuccessState(this.departmentModel);
}

class CreateDepartmentFailureState extends CreateDepartmentState {
  final String error;

  CreateDepartmentFailureState(this.error);
}
