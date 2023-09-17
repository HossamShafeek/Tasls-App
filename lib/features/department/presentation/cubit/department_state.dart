import 'package:tasks_app/features/department/data/models/department_model/department_model.dart';

abstract class DepartmentState {}

class DepartmentInitialState extends DepartmentState {}

class DepartmentLoadingState extends DepartmentState {}

class DepartmentSuccessState extends DepartmentState {
  final DepartmentModel departmentModel;

  DepartmentSuccessState(this.departmentModel);
}

class DepartmentFailureState extends DepartmentState {
  final String error;

  DepartmentFailureState(this.error);
}
