import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/user/data/models/employyees_model/employees_model.dart';
import 'package:tasks_app/features/user/data/repository/user_repository.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_employees/get_all_employees_state.dart';

class GetAllEmployeesCubit extends Cubit<GetAllEmployeesState> {
  GetAllEmployeesCubit(this.userRepository)
      : super(GetAllEmployeesInitialState());
  final UserRepository userRepository;

  static GetAllEmployeesCubit get(context) => BlocProvider.of(context);

  EmployeesModel? employeesModel;

  Future<void> getAllEmployees() async {
    emit(GetAllEmployeesLoadingState());
    Either<Failure, EmployeesModel> result;
    result = await userRepository.getAllEmployees();
    result.fold((failure) {
      emit(GetAllEmployeesFailureState(failure.error));
    }, (employeesModel) {
      this.employeesModel = employeesModel;
      emit(GetAllEmployeesSuccessState(employeesModel));
    });
  }
}
