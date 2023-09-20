import 'package:tasks_app/features/user/data/models/employyees_model/employees_model.dart';

abstract class GetAllEmployeesState {}

class GetAllEmployeesInitialState extends GetAllEmployeesState {}

class ChangeGroupValue extends GetAllEmployeesState {}

class GetAllEmployeesLoadingState extends GetAllEmployeesState {}

class GetAllEmployeesSuccessState extends GetAllEmployeesState {
  final EmployeesModel employeesModel;

  GetAllEmployeesSuccessState(this.employeesModel);
}

class GetAllEmployeesFailureState extends GetAllEmployeesState {
  final String error;

  GetAllEmployeesFailureState(this.error);
}
