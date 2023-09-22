import 'package:tasks_app/features/department/data/models/create_department_model/department_model.dart';

abstract class UpdateDepartmentState {}

class UpdateDepartmentInitialState extends UpdateDepartmentState {}

class UpdateDepartmentLoadingState extends UpdateDepartmentState {}

class UpdateDepartmentSuccessState extends UpdateDepartmentState {
  final CreateDepartmentModel updateDepartmentModel;

  UpdateDepartmentSuccessState(this.updateDepartmentModel);
}

class UpdateDepartmentFailureState extends UpdateDepartmentState {
  final String error;

  UpdateDepartmentFailureState(this.error);
}
