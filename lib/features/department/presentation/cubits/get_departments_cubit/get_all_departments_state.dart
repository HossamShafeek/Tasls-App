import 'package:tasks_app/features/department/data/models/departments_model/departments_model.dart';

abstract class GetAllDepartmentsState {}

class GetAllDepartmentsInitialState extends GetAllDepartmentsState {}

class GetAllDepartmentsLoadingState extends GetAllDepartmentsState {}

class GetAllDepartmentsSuccessState extends GetAllDepartmentsState {
  final DepartmentsModel departmentModel;

  GetAllDepartmentsSuccessState(this.departmentModel);
}

class GetAllDepartmentsFailureState extends GetAllDepartmentsState {
  final String error;

  GetAllDepartmentsFailureState(this.error);
}
