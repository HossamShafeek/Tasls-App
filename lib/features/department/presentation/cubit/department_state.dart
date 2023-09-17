import 'package:tasks_app/features/department/data/models/create_department_model/department_model.dart';
import 'package:tasks_app/features/department/data/models/departments_model/departments_model.dart';

abstract class DepartmentState {}

class DepartmentInitialState extends DepartmentState {}

class CreateDepartmentLoadingState extends DepartmentState {}

class CreateDepartmentSuccessState extends DepartmentState {
  final CreateDepartmentModel departmentModel;

  CreateDepartmentSuccessState(this.departmentModel);
}

class CreateDepartmentFailureState extends DepartmentState {
  final String error;

  CreateDepartmentFailureState(this.error);
}

class GetAllDepartmentsLoadingState extends DepartmentState {}

class GetAllDepartmentsSuccessState extends DepartmentState {
  final DepartmentsModel departmentModel;

  GetAllDepartmentsSuccessState(this.departmentModel);
}

class GetAllDepartmentsFailureState extends DepartmentState {
  final String error;

  GetAllDepartmentsFailureState(this.error);
}
